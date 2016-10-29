rsyslog
=======

## docker-compose.yml

```yaml
rsyslog:
  image: vimagick/rsyslog
  ports:
    - "514:514/tcp"
    - "514:514/udp"
  volumes:
    - ./log:/var/log
  restart: always
```

## Up and Running

```bash
$ docker-compose up -d
$ docker-compose exec rsyslog sh
>>> logger -t debug hello world
>>> tail /var/log/messages
2016-10-29T07:52:15.177918+00:00 c88f52cf86b6 debug: hello world
```
