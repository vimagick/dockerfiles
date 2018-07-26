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
>>> exit

# Producer
$ kafkacat -P -b localhost:9092 -t my-topic

# Consumer
$ kafkacat -C -b localhost:9092 -t my-topic -o end
```
