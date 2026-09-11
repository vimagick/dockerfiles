icecast
=======

[Icecast][1] is a streaming media project released as free software maintained
by the Xiph.org Foundation.

## docker-compose.yml

```yaml
services:
  icecast:
    image: easypi/icecast
    ports:
      - "8000:8000"
    volumes:
      - ./data/etc:/etc/icecast:ro
      - ./data/log:/var/log/icecast:rw
    restart: unless-stopped
```

> You can mount custom config file: [icecast.xml][2]

## Server Setup

```bash
$ mkdir -p data/{etc,log}
$ chmod -R 777 data/log
$ docker-compose up -d
```

## Client Setup

- Linux: ices
- MacOS: butt

[1]: http://icecast.org/
[2]: https://github.com/xiph/Icecast-Server/tree/master/conf
