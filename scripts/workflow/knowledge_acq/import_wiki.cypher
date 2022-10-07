// use cypher-shell to execute the cypher script
// import wikidata to the neo4j database
// reference: https://neo4j.com/labs/neosemantics/how-to-guide/#_previewing_the_data

// initial setup
CREATE CONSTRAINT n10s_unique_uri ON (r:Resource) ASSERT r.uri IS UNIQUE; // this constraint is **required** for rdf.import.fetch!
CALL n10s.graphconfig.init({
  handleVocabUris: 'MAP', 
  handleMultival: 'ARRAY', 
  keepLangTag: false, 
  keepCustomDataTypes: true, 
  applyNeo4jNaming: true 
})

// preview from url
WITH '...' AS sparql

CALL n10s.rdf.preview.fetch(
  'https://query.wikidata.org/sparql?query='+ apoc.text.urlencode(sparql),
  'Turtle' ,
  { headerParams: { Accept: "application/x-turtle" } }
)
YIELD nodes, relationships
RETURN nodes, relationships

// persist data
WITH '...' AS sparql

CALL n10s.rdf.import.fetch(
  'https://query.wikidata.org/sparql?query='+ apoc.text.urlencode(sparql),
  'Turtle' ,
  { headerParams: { Accept: "application/x-turtle" } }
)
YIELD terminationStatus, triplesLoaded, triplesParsed
RETURN terminationStatus, triplesLoaded, triplesParsed

// infer same place relationship
// ref: https://neo4j.com/labs/neosemantics/4.0/inference/
// ref: https://towardsdatascience.com/link-prediction-with-neo4j-part-2-predicting-co-authors-using-scikit-learn-78b42356b44c
// note: need to consider all types of relationships (born/die/citizen etc.)
// note: need to exclude the most coarse level locations (e.g., PRC, Qing Dynasty, etc.)
MATCH (person1:Master)-[:BORN_IN|:DIE_IN|:IS_CITIZEN_OF|:RESIDE_IN]->(location:Place)<-[:BORN_IN|:DIE_IN|:IS_CITIZEN_OF|:RESIDE_IN]-(person2:Master)
WHERE (NOT location.placeENName[0] IN ["China", "Republic of China", "Qing dynasty", "People\'s Republic of China"]) AND (person1 <> person2)
WITH person1, person2, location
ORDER BY location.placeENName
WITH person1, person2, collect(location.placeENName[0]) AS locations,
  count(*) AS number
MERGE (person1)-[shared_places:SHARE_PLACES {locations: locations}]-(person2)
SET shared_places.number = number;

// infer time relationship (if overlap exists)
MATCH (person1:Master) MATCH (person2:Master)
WHERE person1 <> person2
AND EXISTS(person1.birthDate)
AND EXISTS(person2.birthDate)
AND EXISTS(person1.deathDate)
AND EXISTS(person2.deathDate)
AND (person1.birthDate[0].year < person2.deathDate[0].year OR person2.birthDate[0].year < person1.deathDate[0].year)
WITH person1, person2, apoc.coll.min([person1.deathDate[0].year, person2.deathDate[0].year]) - apoc.coll.max([person1.birthDate[0].year, person2.birthDate[0].year]) AS years
MERGE (person1)-[:SHARE_TIME {years: years}]-(person2)