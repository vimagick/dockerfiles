kafka-pixy
==========

[Kafka-Pixy][1] is a dual API (gRPC and REST) proxy for Kafka with automatic
consumer group control.

## docker-compose.yml

```yaml
version: "3.8"
services:
  kafka-pixy:
    image: mailgun/kafka-pixy
    command: --config /etc/kafka-pixy/kafka-pixy.yaml
    ports:
      - "19091:19091"
      - "19092:19092"
    volumes:
      - ./data:/etc/kafka-pixy
    restart: unless-stopped
```

## up and running

```bash
$ mkdir -p data
$ wget -O data/kafka-pixy.yaml https://github.com/mailgun/kafka-pixy/raw/master/default.yaml

# change kafka & zookeeper settings
$ vim data/kafka-pixy.yaml

$ docker-compose up -d
$ curl http://127.0.0.1:19092/topics
```

[1]: https://github.com/mailgun/kafka-pixy
