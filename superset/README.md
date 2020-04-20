superset
========

## Up and Running

```bash
$ mkdir -p -m 777 data/superset
$ wget -P data/superset https://github.com/amancevice/superset/raw/master/examples/celery/superset/superset_config.py

$ echo 'ENABLE_PROXY_FIX = True' >> data/superset/superset_config.py
$ echo 'MAPBOX_API_KEY=pk.xxxxxx.xxxxxx' > .env

$ docker-compose up -d
$ docker-compose exec superset superset-init

Username [admin]: admin
User first name [admin]:
User last name [user]:
Email [admin@fab.org]:
Password: ******
Repeat for confirmation: ******

$ curl http://localhost:8088
```

## Upgrading Guide

- <https://superset.apache.org/installation.html#upgrading>
