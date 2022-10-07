// We only define two most representative inferred relationships here, 
// to specify others, you can refer to our script to generate from the template

// inverse relationship: is_student_of & is_master_of
MATCH (t:Master)-[r:IS_MASTER_OF]->(s:Master)
CREATE (s)-[rel:IS_STUDENT_OF]->(t)
RETURN rel

MATCH (s:Master)-[r:IS_STUDENT_OF]->(t:Master)
CREATE (t)-[rel:IS_MASTER_OF]->(s)
RETURN rel

// clean duplicated relationships
MATCH (a:Master)-[r]->(b:Master)
WITH a, type(r) as type, collect(r) as rels, b
WHERE size(rels) > 1
UNWIND tail(rels) as rel
DELETE rel

// transitive relation: is_descendant_of
MATCH (d:Style)-[:IS_DESCENDANT_OF*2..]->(a:Style)
CREATE (d)-[rel:IS_DESCENDANT_OF]->(a)
RETURN rel

// clean duplicated relationships
MATCH (a:Style)-[r]->(b:Style)
WITH a, type(r) as type, collect(r) as rels, b
WHERE size(rels) > 1
UNWIND tail(rels) as rel
DELETE rel


