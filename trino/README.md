trino
=====

[Trino][1] is a distributed SQL query engine designed to query large data sets
distributed over one or more heterogeneous data sources.

```bash
$ mkdir -p data/{etc,var}
$ chown -R 1000:1000 data
$ docker-compose up -d
$ docker-compose exec trino trino
>>> show catalogs;
>>> show schemas from jmx;
>>> show tables from jmx.current;
>>> select * from jmx.current."java.lang:type=operatingsystem";
>>> quit
```

[1]: https://trino.io/docs/current/installation/deployment.html
