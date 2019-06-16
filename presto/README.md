presto
======

[Presto][1] is a distributed SQL query engine designed to query large data sets
distributed over one or more heterogeneous data sources.

## docker-compose.yaml

```yaml
presto:
  image: vimagick/presto
  ports:
    - "8080:8080"
  volumes:
    - ./conf/standalone:/opt/presto/etc
    - ./data/standalone:/data
  restart: unless-stopped
```

## up and running

```bash
$ docker-comopse up -d
$ curl http://localhost:8080/
```

[1]: https://prestodb.io/
