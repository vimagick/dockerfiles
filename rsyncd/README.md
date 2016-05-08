rsyncd
======

![](https://badge.imagelayers.io/vimagick/rsyncd:latest.svg)

[rsync][1] is an open source utility that provides fast incremental file transfer.
[rsyncd][2] is rsync in daemon mode.

## docker-compose.yml

```yaml
rsyncd:
  image: vimagick/rsyncd
  ports:
    - "873:873"
  volumes:
#   - ./rsyncd.conf:/etc/rsyncd.conf
    - ./share:/share
  restart: always
```

> You can mount `rsyncd.conf` to override the default one.

## rsyncd.conf (default)

```
[global]
charset = utf-8
max connections = 8
reverse lookup = no

[share]
path = /share
read only = yes
#hosts allow = 192.168.0.0/16
#auth users = *
#secrets file = /etc/rsyncd.secrets
#strict modes = false
```

## server

```
docker-compose up -d
```

## client

```
rsync -avz easypi.info::share /path/to/folder
```

[1]: https://rsync.samba.org
[2]: https://download.samba.org/pub/rsync/rsyncd.conf.html
