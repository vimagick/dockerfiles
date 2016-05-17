neo4j
=====

[Neo4j][1] is a highly scalable native graph database that leverages data
relationships as first-class entities, helping enterprises build intelligent
applications to meet today’s evolving data challenges.

## docker-compose

```yaml
neo4j:
  image: neo4j
  ports:
    - "7474:7474"
    - "7687:7687"
  volumes:
    - ./data:/data
  environment:
    - NEO4J_CACHE_MEMORY=4G
  ulimits:
    nofile:
      soft: 65535
      hard: 65535
  restart: always
```

## up and running

```
$ docker-compose up -d

$ docker-compose exec neo4j bin/neo4j-shell
>>> man
>>> export person_id="123"
>>> env
>>> create index on :Person(id);
>>> create (p:Person {id: {person_id}}) return p;
>>> match (p:Person {id: {person_id}}) return p;
>>> exit
```

[1]: http://neo4j.com/
