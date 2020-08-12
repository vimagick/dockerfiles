prestosql
========

[Presto][1] is a high performance, distributed SQL query engine for big data.

## standalone mode

```yaml
prestosql:
  image: vimagick/prestosql:alpine
  ports:
    - "8080:8080"
  volumes:
    - ./conf/standalone:/opt/presto/etc:ro
    - /data:/data
  restart: unless-stopped
```

## cluster mode

```bash
$ ansible all -a 'mkdir -p /data'

$ docker stack deploy -c docker-stack.yml prestosql

$ docker ps | grep prestosql_coordinator | awk '{print $1}'
4cc5c6c420d7

$ docker exec -it 4cc5c6c420d7 presto --server localhost:8080 --catalog tpch
>>> show schemas;
>>> show tables from tiny;
>>> select * from tiny.customer limit 10;
>>> quit

$ curl http://localhost:8080/ui/

$ curl http://localhost:8080/v1/service/presto/general
```

> :warning: If volume settings are changed, you need to remove them manually on all nodes.

[1]: https://prestosql.io/
