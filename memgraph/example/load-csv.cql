LOAD CSV FROM "/path/to/dns.csv.gz" WITH HEADER AS row
WITH DISTINCT row.query AS query
MERGE (d:Domain {name: query});

LOAD CSV FROM "/path/to/dns.csv.gz" WITH HEADER AS row
WITH DISTINCT row.answer AS answer WHERE row.type = 'CNAME'
MERGE (d:Domain {name: answer});

LOAD CSV FROM "/path/to/dns.csv.gz" WITH HEADER AS row
WITH DISTINCT row.answer AS answer WHERE row.type = 'A'
MERGE (i:IPv4 {name: answer});

LOAD CSV FROM "/path/to/dns.csv.gz" WITH HEADER AS row
WITH row WHERE row.type = 'A'
MATCH (d:Domain {name: row.query}), (i:IPv4 {name: row.answer})
MERGE (d)-[r:A]->(i)
ON CREATE SET r.created_at = timestamp()/1000000
CALL date.parse(replace(row.`@timestamp`, "Z", ""), "s", "%Y-%m-%dT%H:%M:%S.%f", "UTC") YIELD parsed
SET r.updated_at = parsed;

LOAD CSV FROM "/path/to/dns.csv.gz" WITH HEADER AS row
WITH row WHERE row.type = 'CNAME'
MATCH (d1:Domain {name: row.query}), (d2:Domain {name: row.answer})
MERGE (d1)-[r:CNAME]->(d2)
ON CREATE SET r.created_at = timestamp()/1000000
CALL date.parse(replace(row.`@timestamp`, "Z", ""), "s", "%Y-%m-%dT%H:%M:%S.%f", "UTC") YIELD parsed
SET r.updated_at = parsed;
