redpanda
========

[Redpanda][1] is a streaming data platform for developers. Kafka API
compatible. 10x faster. No ZooKeeper. No JVM!

```bash
$ docker compose up -d
$ docker compose exec redpanda bash
>>> rpk cluster info
>>> rpk topic create chat-room
>>> rpk topic alter-config chat-room --set replication.factor=3
>>> echo "Pandas are fabulous!" | rpk topic produce chat-room
>>> rpk topic consume chat-room --num 1
>>> exit
$ curl 127.0.0.1:9644/public_metrics
```

[1]: https://github.com/redpanda-data/redpanda
