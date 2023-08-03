## MA<sup>2</sup>KG & MAont

This project contains the core ontologies, RDF resouces and scripts used for developing the <strong>M</strong>artial <strong>A</strong>rts <strong>MA</strong>sters <strong>K</strong>nowledge <strong>G</strong>raph (MA<sup>2</sup>KG).

### Ontologies

#### /core_ontologies/MAont

The <strong>M</strong>artial <strong>A</strong>rts Ontology (MAont) describes martial arts as an entity of embodied knowledge with a conceptual space incorporating three dimensions: the kinesthetic, stylistic, and social dimensions. 
The <strong>MAont Version 1.0 </strong>, extended from its [basis](https://github.com/renie26/ont), accentuates the role of <b>people</b> in transmitting and (re)developing different styles and expands the <b>Master</b> module accordingly.
    
##### Version 1.0 [Doc](http://EncodingActs.github.io/doc/MAont/extract.html)

#### /core_ontologies/hkmalakg
The ontology, devised from MA_ont, is tuned for describing the archival items in the *Hong Kong Martial Arts Living Archive* (HKMALA).

### Knowledge graph (KG) instantiation

#### /rdf/hkmalakg_wiki.ttl

This file contains the master-centric RDF instantiation for the MA<sup>2</sup>KG, by integrating data from multiple, multilingual sources, e.g., *Wikidata*, *Baidu Baike*, the *Hong Kong Martial Arts Living Archive*, and manual annotations. Data acquisition was performed based on the **MAont** ontological framework. 
##### Version 1.0 [Doc](http://EncodingActs.github.io/doc/MA2KG/extract.html)

### Scripts

#### /scripts
This folder contains the technical details with ready-to-use scripts for re-producing the KG construction acquisition and inference process. 

### Dataset creators
[Lin Yuan](https://people.epfl.ch/lin.yuan/?lang=en) (Investigation, Transcription, Implementation).
[Yumeng Hou](https://renie26.github.io/homepage.github.io/) (Design, Transcription, Organisation, Supervision).

### License
This project is licensed under the terms of the MIT license.
