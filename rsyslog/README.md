rsyslog
=======

[RSYSLOG][1] is the rocket-fast system for log processing.

## docker-compose.yml

```yaml
rsyslog:
  image: vimagick/rsyslog
  ports:
    - "514:514/tcp"
    - "514:514/udp"
  volumes:
    - ./rsyslog.conf:/etc/rsyslog.conf
    - ./data:/var/log
  restart: always
```

## Up and Running

```bash
$ docker-compose up -d

$ docker-compose exec rsyslog sh
>>> pwd
/var/log
>>> tail -f /var/log/syslog
2016-10-29T08:17:34+00:00 172.17.0.1 root: hello
2016-10-29T08:17:41+00:00 172.17.0.1 root: world
^C
>>> exit

$ logger -n localhost -p mail.debug hello
$ logger -n localhost -p mail.info world
```

[1]: http://www.rsyslog.com/
