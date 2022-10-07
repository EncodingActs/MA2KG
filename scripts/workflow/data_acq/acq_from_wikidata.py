from configs.defaults import get_cfg_defaults
from py2neo import Graph
import argparse
import json

# Load default configurations
cfg = get_cfg_defaults()

# Merge yaml configuration if needed
parser = argparse.ArgumentParser(description='Data Acquisition, commandline parameter')
parser.add_argument('--yaml', dest = "yaml", type=str, default=None, help="yaml setting", required=True)
args = parser.parse_args()

if "yaml" not in args.yaml:
	cfg.merge_from_file("configs/{}.yaml".format(args.yaml))
else:
	cfg.merge_from_file("configs/{}".format(args.yaml))

cfg.freeze()

if __name__ == '__main__':

	# Connect to the graph database
	uri = cfg.DB.URI
	user = cfg.DB.USER
	password = cfg.DB.PASSWORD
	graph = Graph(uri, auth=(user, password))

	# Load template and params
	template_path = cfg.TEMPLATE.PATH
	params_path = cfg.TEMPLATE.PARAMS
	wikidata_api_path = cfg.TEMPLATE.WIKIDATA
	with open(template_path, "r", encoding="utf-8") as f:
		template = f.read()
	params = json.loads(params_path)
	with open(wikidata_api_path, "r", encoding="utf-8") as f:
		wikidata_api = f.read()

	# Replace in the template with the params
	for param, value in params.items():
		template = template.replace("$"+param, value)
	template_sparql = "WITH" + template + "AS sparql"
	wikidata_sparql = template_sparql + wikidata_api

	# Fetch from Wikidata and import to the database
	graph.run(wikidata_sparql)
