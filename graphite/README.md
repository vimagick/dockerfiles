graphite
========

[Graphite][1] does three things:

- Kick ass.
- Chew bubblegum.
- Make it easy to store and graph metrics.

![](https://github.com/graphite-project/graphite-web/raw/master/webapp/content/img/overview.png)

## docker-compose.yml

```yaml
version: "3.8"
services:
  graphite:
    image: vimagick/graphite
    ports:
      - "2003:2003/udp"
      - "2003:2003"
      - "2004:2004"
      - "2023:2023"
      - "2024:2024"
      - "7002:7002"
      - "8080:8080"
      - "9001:9001"
    volumes:
      - ./data/conf:/opt/graphite/conf
      - ./data/storage:/opt/graphite/storage
      - ./data/storage/log/webapp:/opt/graphite/storage/log/webapp
    restart: unless-stopped
```

## Up and Running

```bash
$ cd ~/fig/graphite

$ docker-compose run --rm graphite sh
>>> django-admin migrate --noinput --run-syncdb
>>> django-admin createsuperuser
>>> django-admin changepassword
>>> exit

$ docker-compose up -d

$ docker-compose exec graphite sh
>>> vi conf/storage-schemas.conf
>>> supervisorctl restart all
>>> supervisorctl status
carbon-aggregator   RUNNING   pid 9, uptime 0:00:13
carbon-cache        RUNNING   pid 8, uptime 0:00:22
graphite-webapp     RUNNING   pid 7, uptime 0:00:24
>>> exit

$ tree -F -L 4
├── data/
│   ├── conf/
│   │   ├── aggregation-rules.conf
│   │   ├── carbon.conf
│   │   ├── rewrite-rules.conf
│   │   └── storage-schemas.conf
│   └── storage/
│       ├── carbon-aggregator-a.pid
│       ├── carbon-cache-a.pid
│       ├── graphite.db
│       ├── log/
│       │   └── webapp/
│       └── whisper/
│           └── carbon/
└── docker-compose.yml

$ curl http://localhost:8080
```

> :warning: Stale pid files may prevent services from starting.
> Please delete these pid files manually before restarting or upgrading container.

## storage-schemas.conf

```ini
[carbon]
pattern = ^carbon\.
retentions = 60:90d

[test_1day_for_1year]
pattern = ^test\.
retentions = 1d:1y

[default_1min_for_1day]
pattern = .*
retentions = 60s:1d
```

## Resize Whisper

```bash
$ docker-compose exec graphite sh
>>> cd storage/whisper/test
>>> find . -type f -name '*.wsp' -exec whisper-resize.py --nobackup {} 1d:1y \;
```

[1]: http://graphiteapp.org/
