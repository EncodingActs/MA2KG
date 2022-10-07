# KungfuKG

## Table of Contents

- [File Structure](#file-structure)
- [Usage](#usage)
- [Abstract](#abstract)
- [Specification](#specification)
- [Sources](#sources)
  - [Research paper](#research-paper)
  - [Data sources](#data-sources)
  - [Insightful cases](insightful-cases)
  - [Toolkits](#toolkits)
- [License](#license)

## File Structure

- `./utils/` includes the scripts for the utility use
- `./workflow/` includes the scripts and templates for relevant technical processes
- `./onts/` please put your ontology files under this path


## Usage

### Software

- `Protege==5.5.0`: for editing & previewing the ontology
- `GraphViz==2.48.0`: for solving the overlapping issue in the OWLViz
  (replace the "File->Preferences->OWLViz->Path to DOT" using the dox.exe in .../GraphViz/bin/dot.exe)
- `Neo4j==4.3`: for storing and managing the knowledge graph data
- ...

## Resources

### Data sources

- [Wikipedia: List of Chinese martial arts](https://en.wikipedia.org/wiki/List_of_Chinese_martial_arts)

  containing a concise listing of articles of styles in Chinese martial arts, for **enriching style data** and related information (e.g., creator, style system, legendary figures)

- [Wikidata: Open strucutred data](https://www.wikidata.org/wiki/Wikidata:Main_Page)

  the free and open knowledge base/graph, served as the **structured data** of Wikipedia articles;

  providing [SPARQL query service](https://www.wikidata.org/wiki/Wikidata:SPARQL_query_service/Wikidata_Query_Help) where we can fetch needed data, see tutorials from [Towards Data Science](https://towardsdatascience.com/how-to-extract-knowledge-from-wikipedia-data-science-style-35f50f095d1a), [neo4j Developer Guide](https://neo4j.com/developer/graph-data-science/build-knowledge-graph-nlp-ontologies/), and [neosemantics how-to guide](https://neo4j.com/labs/neosemantics/how-to-guide)

- [Wikipedia: List of Chinese martial artists](https://en.wikipedia.org/wiki/Category:Chinese_martial_artists)

  containing a listing of famous artists, could be used as starting point of SPARQL query

- [Baidu Baike: Kung Fu](https://baike.baidu.com/item/%E5%8A%9F%E5%A4%AB/10621#viewPageContent)

  the Kung Fu article from Chinese wiki, complementary to English Wikipedia; 

  problem: only unstructured data, no comprehensive listing of related articles;

  challenge: **data integration & disambiguation** with corresponding English articles

- [Exihibition: 300 Years of Hakka Kung Fu](http://hakkakungfu.com/exhibits/masters_archive/)

  the exhibition of one important branch in Chinese Kung Fu groups (Hakka Kung Fu), have limited number of the master biography

- [HKMALA: The Hong Kong Martial Arts Living Archive](https://www.ichandmuseums.eu/en/inspiration-2/detail-2/the-hong-kong-martial-arts-living-archive)

  the digital archive initiated by Sarah, mostly motion capturing data to record different styles and taolu


### Toolkits used

- [neosemantics](https://neo4j.com/labs/neosemantics/4.0/)
  a plugin that enables the use of RDF in Neo4j
- [Wikidata Toolkits](https://www.wikidata.org/wiki/Wikidata:Tools/For_programmers)
  all toolkits for programmers, provided by Wikidata
- [py2neo](https://py2neo.org/2021.1/index.html)
  a client library and toolkit for working with Neo4j from within Python applications



## License

This project uses the MIT License.

