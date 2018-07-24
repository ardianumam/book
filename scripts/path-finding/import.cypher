// tag::neo4j-import-nodes[]
WITH "https://github.com/neo4j-graph-analytics/book/raw/master/data/transport-nodes.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE (:Place {id:row.id})
// end::neo4j-import-nodes[]

// tag::neo4j-import-relationships[]
WITH "https://github.com/neo4j-graph-analytics/book/raw/master/data/transport-relationships.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (origin:Place {id: row.src})
MATCH (destination:Place {id: row.dst})
MERGE (origin)-[:EROAD {distance: toInteger(row.cost)}]->(destination)

// end::neo4j-import-relationships[]
