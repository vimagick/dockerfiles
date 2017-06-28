graphite
========

[Graphite][1] does three things:

- Kick ass.
- Chew bubblegum.
- Make it easy to store and graph metrics.

## docker-compose.yml

```yaml
graphite:
  image: vimagick/graphite
  ports:
    - "2003:2003"
    - "2004:2004"
    - "7002:7002"
    - "8080:8080"
    - "9001:9001"
  volumes:
    - ./data:/opt/graphite/storage
  restart: always
```

## Up and Running

```bash
$ cd ~/fig/graphite
$ mkdir -p data/log/webapp
$ docker-compose up -d
$ docker-compose exec graphite sh
>>> vi conf/storage-schemas.conf
>>> python webapp/manage.py migrate --run-syncdb --noinput
>>> exit
$ tree -F -L 3
├── data/
│   ├── carbon-cache-a.pid
│   ├── graphite.db
│   ├── log/
│   │   └── webapp/
│   └── whisper/
│       └── carbon/
└── docker-compose.yml
$ curl http://localhost:8080
```

## storage-schemas.conf

```ini
[carbon]
pattern = ^carbon\.
retentions = 60:90d

[leancloud_1day_for_1year]
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
