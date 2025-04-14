influxdb
========

[InfluxDB][1] is an open source distributed time series database with no external
dependencies. It's useful for recording metrics, events, and performing analytics.

## up and running

```bash
$ docker-compose up -d
$ docker-compose exec influxdb bash
>>> influx setup \
  --username USERNAME \
  --password PASSWORD \
  --token TOKEN \
  --org ORG_NAME \
  --bucket BUCKET_NAME \
  --force
```

[1]: https://influxdata.com/
