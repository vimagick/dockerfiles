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
      - ./data/etc/squid.conf:/etc/squid/squid.conf:ro
      - ./data/etc/conf.d:/etc/squid/conf.d:ro
      - ./data/var:/var/cache/squid
      - ./data/log:/var/log/squid
    tmpfs:
      - /run
    stop_signal: SIGKILL
    restart: unless-stopped
```

> [!Tip]
> - You can mount custom config file as `/etc/squid/squid.conf`
> - You need to run `squid -z` when `cache_dir ufs` is enabled
> - Do not mount entire `./data/etc`, since many files in `/etc/squid/`

## Up and Running

### Server

```bash
$ mkdir -p data/{etc/conf.d,var,log}
$ vim data/etc/squid.conf
$ chmod -R 777 data

$ docker-compose run --rm --entrypoint sh squid
>>> id squid
uid=31(squid) gid=31(squid) groups=31(squid),31(squid),101(winbind)
>>> squid -k parse
>>> squid -z
>>> exit

$ docker-compose up -d

$ find data/var/ -type f
$ tail -f data/log/*.log
```

> [!Note]
> Files and directories should be accessable by `uid=31,gid=31`

### Client

```bash
$ curl -I -x 127.0.0.1:3128 ipinfo.io
HTTP/1.1 200 OK

$ curl -I -x 127.0.0.1:3128 https://ipinfo.io
HTTP/1.1 200 Connection established
HTTP/1.1 200 OK

$ curl -I -x 127.0.0.1:3128 doubleclick.net
HTTP/1.1 403 Forbidden

$ curl -I -x 127.0.0.1:3128 https://doubleclick.net
HTTP/1.1 403 Forbidden
```

> [!Note]
> ad-block works as expected!

[1]: http://www.squid-cache.org/
