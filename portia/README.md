portia
======

![](https://badge.imagelayers.io/vimagick/portia:latest.svg)

[Portia][1] is a tool that allows you to visually scrape websites without any
programming knowledge required.

## docker-compose.yml

```yaml
portia:
  image: vimagick/portia
  container_name: portia
  ports:
    - "9001:9001"
  volumes:
    - ./data:/app/slyd/data
  restart: always
```

## up and running

```bash
$ cd ~/fig/portia/
$ docker-compose up -d
$ firefox http://localhost:9001/static/index.html
```

[1]: https://github.com/scrapinghub/portia
