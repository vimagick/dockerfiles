presto
======

[Presto][1] is a distributed SQL query engine designed to query large data sets
distributed over one or more heterogeneous data sources.

## up and running

```bash
$ ansible all -a 'mkdir -p /data'

$ docker stack deploy -c docker-stack.yml presto

$ docker service update --replicas-max-per-node=1 presto_worker

$ docker service update --replicas 10 presto_worker

$ docker ps | grep presto_coordinator | awk '{print $1}'
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

[1]: https://prestodb.io/
