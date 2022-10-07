// Show top 10 score
CALL gds.pageRank.stream('node-influence') YIELD nodeId, score
RETURN gds.util.asNode(nodeId).name AS name, score
ORDER BY score DESC LIMIT 10

// Compare the score with number of interactions
CALL gds.pageRank.stream('node-influence') YIELD nodeId, score AS pageRank
WITH gds.util.asNode(nodeId) AS n, pageRank
MATCH (n)-[i:INTERACTS]-()
RETURN n.name AS name, pageRank, count(i) AS interactions
ORDER BY pageRank DESC LIMIT 10

// Write the pagerank score as property
CALL gds.pageRank.write('node-influence', {writeProperty: 'pageRank'})