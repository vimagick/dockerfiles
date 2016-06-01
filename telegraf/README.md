telegraf
========

[Telegraf][1] is an open source agent written in Go for collecting metrics and
data on the system it's running on or from other services. Telegraf writes data
it collects to InfluxDB in the correct format.

## docker-compose.yml

```yaml
telegraf:
  image: telegraf:alpine
  ports:
    - "8092:8092/udp"
    - "8094:8094/tcp"
  volumes:
    - ./telegraf.conf:/etc/telegraf/telegraf.conf
  restart: always
```

## up and running

```bash
$ cd ~/fig/telegraf/
$ docker-compose run --rm telegraf -sample > telegraf.conf
$ vim telegraf.conf
$ docker-compose up -d
```

[1]: https://github.com/influxdata/telegraf
