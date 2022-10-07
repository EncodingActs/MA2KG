import os
from yacs.config import CfgNode as CN

"""
This file only used for default settings, please further specify the configurations in `exp.yaml`.
"""
_C = CN()

# -----------------------------------------------------------------------------
# Database
# -----------------------------------------------------------------------------
_C.DB = CN()
_C.DB.URI = "bolt://localhost:7687"
_C.DB.USER = "neo4j"
_C.DB.PASSWORD = "asdfgh"

# -----------------------------------------------------------------------------
# Template
# -----------------------------------------------------------------------------
_C.TEMPLATE = CN()
_C.TEMPLATE.PATH = "templates/general_all_artists.sparql"
_C.TEMPLATE.PARAMS = "templates/params.json"
_C.TEMPLATE.WIKIDATA = "templates/wikidata_api.txt"


def get_cfg_defaults():
  """Get a yacs CfgNode object with default values for my_project."""
  # Return a clone so that the defaults will not be altered
  # This is for the "local variable" use pattern
  return _C.clone()