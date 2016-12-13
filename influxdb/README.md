influxdb
========

> :warning: Please use the official image [influxdb](https://hub.docker.com/_/influxdb/)!

[InfluxDB][1] is an open source distributed time series database with no external
dependencies. It's useful for recording metrics, events, and performing
analytics.

## docker-compose.yml

For official image:

```yaml
influxdb:
  image: influxdb:alpine
  ports:
    - "8083:8083"
    - "8086:8086"
  volumes:
    - ./data:/var/lib/influxdb
  restart: always
```

For unofficial image:

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

## up and running

```bash
$ docker-compose up -d
$ docker-compose exec influxdb influx
>>> show databases
name: databases
name
----
_internal
db_name

>>> use db_name
Using database db_name

>>> show series
key
---
cpu

>>> quit
```

- Open url: <http://localhost:8083>
- Create user: `CREATE USER "username" WITH PASSWORD 'password'`
- Create database: `CREATE DATABASE "db_name"`
- Select database: `db_name`
- Write data: `INSERT cpu,host=serverA,region=us_west value=0.64`
- Query data: `SELECT * FROM cpu`

[1]: https://influxdata.com/
