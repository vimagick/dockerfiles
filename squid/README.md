squid
=====

[Squid][1] is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and
more. It reduces bandwidth and improves response times by caching and reusing
frequently-requested web pages. Squid has extensive access controls and makes a
great server accelerator. It runs on most available operating systems,
including Windows and is licensed under the GNU GPL.

## docker-compose.yml

```yaml
services:
  squid:
    image: easypi/squid
    ports:
      - "3128:3128/tcp"
      - "3130:3130/udp"
    volumes:
      - ./data/etc:/etc/squid
      - ./data/var:/var/cache/squid
      - ./data/log:/var/log/squid
    stop_signal: SIGKILL
    restart: unless-stopped
```

> You can mount custom config file as `/etc/squid/squid.conf`.
>> You need to run `squid -z` when `cache_dir ufs` is enabled.

## Up and Running

```bash
# server
$ mkdir -p data/{etc,var,log}
$ chmod -R 777 data
$ docker-compose run --rm squid squid -z
$ docker-compose up -d

# client
$ curl -x 127.0.0.1:3128 ipinfo.io
```

[1]: http://www.squid-cache.org/
