pdnsd
=====

`pdnsd` is a proxy DNS server with permanent caching (the cache contents are
written to hard disk on exit) that is designed to cope with unreachable or down
DNS servers (for example in dial-in networking).

Since version 1.1.0, pdnsd supports negative caching.

## docker-compose.yml

```
pdnsd:
  image: vimagick/pdnsd
# volumes:
#   - pdnsd.conf:/etc/pdnsd.conf
  ports:
    - "53:53/tcp"
    - "53:53/udp"
  restart: always
```

> Uncomment `volumes` to use customized config file.
