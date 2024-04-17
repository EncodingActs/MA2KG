## MA<sup>2</sup>KG

This project contains the core ontologies, RDF dataset and scripts used for developing the <strong>M</strong>artial <strong>A</strong>rt <strong>MA</strong>sters <strong>K</strong>nowledge <strong>G</strong>raph (MA<sup>2</sup>KG).
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.8211203.svg)](https://doi.org/10.5281/zenodo.8211203)

### Suggested citation:
> Hou, Yumeng, and Lin Yuan. "Building a Knowledge Graph of Chinese Kung Fu Masters From Heterogeneous Bilingual Data." Journal of Open Humanities Data 9 (2023).

BibTeX
>  @article{hou2023building,
  title={Building a Knowledge Graph of Chinese Kung Fu Masters From Heterogeneous Bilingual Data},
  author={Hou, Yumeng and Yuan, Lin},
  journal={Journal of Open Humanities Data},
  volume={9},
  year={2023}
}

### Ontologies

#### [MAon](https://github.com/EncodingActs/MAon)

The <strong>M</strong>artial <strong>A</strong>rt <strong>On</strong>tology (MAon) describes martial arts as an entity of embodied knowledge with a conceptual space incorporating three dimensions: the kinesthetic, stylistic, and social dimensions. This work primarily utilizes the excerpts of the ontology with a concentration on the MA_Master class to articulate on the role of <b>people</b> in transmitting and (re)developing different styles.

#### /core_ontologies/hkmalakg
The ontology, devised from MAon, is tuned for describing the archival items in the *Hong Kong Martial Arts Living Archive* (HKMALA).

### Knowledge graph (KG) instantiation

#### /data/hkmalakg_wiki.ttl

This file contains the master-centric RDF instantiation for the MA<sup>2</sup>KG, in TTL syntax, by integrating data from multiple, multilingual sources, e.g., *Wikidata*, *Baidu Baike*, the *Hong Kong Martial Arts Living Archive*, and manual annotations. Data acquisition was performed based on the MAon ontological framework. 
##### Martial Art MAsters Knowledge Graph (MA2KG) Version 1.0 [Doc](https://EncodingActs.github.io/doc/MA2KG/extract.html)

### Scripts

#### /scripts
This folder contains the technical details with ready-to-use scripts for re-producing the KG construction acquisition and inference process. 

### Dataset creators
[Lin Yuan](https://people.epfl.ch/lin.yuan/?lang=en) (Investigation, Transcription, Implementation).

[Yumeng Hou](https://renie26.github.io/homepage.github.io/) (Design, Transcription, Organisation, Supervision).

### License
This project is licensed under the terms of the MIT license.

