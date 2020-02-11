ksqldb
======

[ksqlDB][1] is an event streaming database.

## Up and Running

```bash
$ docker-compose up -d
$ curl http://127.0.0.1:8088/info
$ docker-compose exec ksqldb-cli ksql http://ksql-server:8088
>>> CREATE TABLE products (product_name VARCHAR, cost DOUBLE)
    WITH (kafka_topic='products', partitions=3, value_format='json');
>>> CREATE STREAM products_changelog AS
    SELECT * FROM products EMIT CHANGES;
>>> SHOW TOPICS;
>>> SHOW TABLES;
>>> SHOW STREAMS;
```

## Docs

- ksql: https://docs.confluent.io/current/ksql/docs/index.html
- ksql-server: https://docs.confluent.io/current/ksql/docs/installation/server-config/index.html
- ksql-cli: https://docs.confluent.io/current/ksql/docs/installation/cli-config.html
- connector: https://docs.ksqldb.io/en/latest/concepts/connectors/

[1]: https://ksqldb.io/
