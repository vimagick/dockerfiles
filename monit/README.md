monit
=====

`Monit` is a utility for managing and monitoring processes, programs, files,
directories and filesystems on a Unix system.

## docker-compose.yml

```
monit:
  image: vimagick/monit
  volumes:
    - monit:/etc/monit
  pid: host
  net: host
  restart: always
```

> The control file `/etc/monit/monitrc` must have permissions no more than
> `-rwx------ (0700)`

## server

```
$ cd ~/fig/monit/
$ docker-compose up -d
$ docker exec monit_monit_1 monit status
```

## client

```
$ firefox http://server:2812
```
