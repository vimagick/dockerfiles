icecast
=======

[Icecast][1] is a streaming media project released as free software maintained
by the Xiph.org Foundation.

## docker-compose.yml

```yaml
icecast:
  image: vimagick/icecast
  ports:
    - "8000:8000"
  restart: always
```

## Server Setup

```bash
$ docker-compose up -d
```

## Client Setup

- Linux: ices
- MacOS: butt

[1]: http://icecast.org/
