neo4j
=====

[Neo4j][1] is a highly scalable native graph database that leverages data
relationships as first-class entities, helping enterprises build intelligent
applications to meet today’s evolving data challenges.

## up and running

```bash
$ docker-compose up -d

$ docker-compose exec neo4j bin/neo4j-shell
>>> man
>>> export person_id="123"
>>> env
>>> create index on :Person(id);
>>> create (p:Person {id: {person_id}}) return p;
>>> match (p:Person {id: {person_id}}) return p;
>>> exit

$ curl http://localhost:7474/browser/
```

[1]: http://neo4j.com/
