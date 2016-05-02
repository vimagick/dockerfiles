influxdb
========

[InfluxDB][1] is an open source distributed time series database with no external
dependencies. It's useful for recording metrics, events, and performing
analytics.

## docker-compose.yml

```yaml
influxdb:
  image: vimagick/influxdb
  ports:
    - "8083:8083"
    - "8086:8086"
    - "8088:8088"
    - "25826:25826/udp"
  restart: always
```

[1]: https://influxdata.com/
