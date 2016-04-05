squid
=====

![](https://badge.imagelayers.io/vimagick/squid:latest.svg)

[Squid][1] is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and
more. It reduces bandwidth and improves response times by caching and reusing
frequently-requested web pages. Squid has extensive access controls and makes a
great server accelerator. It runs on most available operating systems,
including Windows and is licensed under the GNU GPL.

## docker-compose.yml

```yaml
squid:
  image: vimagick/squid
  ports:
    - "3128:3128"
    - "3130:3130"
  ulimits:
    nofile:
      soft: 65535
      hard: 65535
  restart: always
```

> You can mount `squid.conf` file.

## Up and Running

```
# server
$ docker-compose up -d

# client
$ curl -x https://localhost:3128 https://www.google.com/
```

[1]: http://www.squid-cache.org/
