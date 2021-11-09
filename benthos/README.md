benthos
=======

![](https://github.com/Jeffail/benthos/raw/master/icon.png)

[Benthos][1] is a high performance and resilient stream processor, able to
connect various sources and sinks in a range of brokering patterns and perform
hydration, enrichments, transformations and filters on payloads.

## docker-compose.yml

```yaml
version: "3.8"
services:
  benthos:
    image: jeffail/benthos
    command: -c /etc/benthos/config.yaml
    ports:
      - "4195:4195"
    volumes:
      - ./data:/etc/benthos
    restart: unless-stopped
```

## config.yaml

```yaml
input:
  mqtt:
    urls:
      - tcp://broker.hivemq.com:1883
    topics:
      - easypi

pipeline:
  processors:
    - jq:
        query: .
    - http:
        url: https://httpbin.org/post

output:
  stdout:
    codec: lines
```

## up and running

```bash
$ docker-compose up -d
$ docker-compose logs -f
$ mosquitto_pub -h broker.hivemq.com -p 1883 -t easypi -m '{"hello":"world"}'
```

[1]: https://github.com/Jeffail/benthos
