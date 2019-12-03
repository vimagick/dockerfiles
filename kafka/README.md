kafka
=====

## How It Works

![](https://github.com/wurstmeister/kafka-docker/wiki/kafka-communication.png)

[read more](https://github.com/wurstmeister/kafka-docker/wiki/Connectivity)

## Up and Running

```bash
# Broker
$ docker-compose up -d
$ docker-compose exec kafka bash
>>> kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 2 --topic my-topic
>>> kafka-topics.sh --alert --zookeeper zookeeper:2181 --topic my-topic --config retention.hours=168
>>> kafka-topics.sh --alert --zookeeper zookeeper:2181 --topic my-topic --delete-config retention.hours
>>> exit

# Producer
$ kafkacat -P -b localhost:9092 -t my-topic

# Consumer
$ kafkacat -C -b localhost:9092 -t my-topic -o end -u -q | jq .
```

## Monitoring

https://telegraf-kafka.readthedocs.io/en/stable/index.html
