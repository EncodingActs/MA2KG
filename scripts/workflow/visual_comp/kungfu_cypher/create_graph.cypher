CALL gds.graph.create(
	'sub-graph', 
	['Master', 'Style', 'Style_Group'],
	['IS_MASTER_OF', 'IS_STUDENT_OF', 'PRACTICES', 'BELONGS_TO_GROUP', 'IS_SUBGROUP_OF', 'IS_DESCENDANT_OF']
)