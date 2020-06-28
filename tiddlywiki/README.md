tiddlywiki
==========

[TiddlyWiki][1] is a unique non-linear notebook for capturing, organising and
sharing complex information.

## docker-compose.yml

```yaml
tiddlywiki:
  image: vimagick/tiddlywiki
  command: >
    username=admin
    password=admin
    writers=(authenticated)
    readers=(anon)
  ports:
    - "8080:8080"
  volumes:
    - ./data:/data
  restart: unless-stopped
```

## up and running

```bash
# initialize wiki
$ docker-compose run --rm --entrypoint tiddlywiki tiddlywiki . --init server

# serves wiki over http
$ docker-compose up -d

# open wiki in browser
$ curl http://127.0.0.1:8080/login-basic

# authorized access
$ curl -u admin:admin http://127.0.0.1:8080/status
```

[1]: https://tiddlywiki.com/
