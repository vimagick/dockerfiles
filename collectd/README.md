collectd
========

`collectd` is a daemon which collects system performance statistics periodically
and provides mechanisms to store the values in a variety of ways, for example
in RRD files.

## docker-compose.yml

```
collectd:
  image: vimagick/collectd
  volumes:
    - /proc:/proc:ro
  restart: always
```
