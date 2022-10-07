# Specified graph created
CALL gds.graph.create(
	'long-tail', 
	['Master', 'Style', 'Style_Group'], 
	{
		IS_MASTER_OF: {orientation: 'UNDIRECTED'},
		IS_STUDENT_OF: {orientation: 'UNDIRECTED'},
		PRACTICES: {orientation: 'UNDIRECTED'},
		BELONGS_TO_GROUP: {orientation: 'UNDIRECTED'},
		IS_SUBGROUP_OF: {orientation: 'UNDIRECTED'},
		IS_DESCENDANT_OF: {orientation: 'UNDIRECTED'}
	}
)

# Case study of Wong Fei-hung and Wong Shun Leung
MATCH (source:Master {personENName: 'Wong Fei-hung'}), (target:Master {personENName: 'Wong Shun Leung'})
CALL gds.shortestPath.dijkstra.stream('long-tail', {
    sourceNode: source,
    targetNode: target
})
YIELD path

MATCH (node1) 
WHERE node1 IN nodes(path)
MATCH (node2) 
WHERE node2 IN nodes(path)
MATCH p=(node1)-[rels]-(node2) 
WHERE node2 <> node1 
RETURN nodes(p), relationships(p);