nullmailer
==========

![](https://badge.imagelayers.io/vimagick/nullmailer:latest.svg)

[nullmailer][1] is a simple relay-only mail transport agent.

## Directory Tree

```
~/fig/nullmailer/
├── Dockerfile
└── nullmailer/
    ├── adminaddr --> username@gmail.com
    └── remotes   --> smtp.gmail.com smtp --port=465 --auth-login --user=username --pass=****** --ssl
```

> Read [this][2] to config.

## docker-compose.yml

```yaml
nullmailer:
  image: vimagick/nullmailer
  cotainer_name: nullmailer
  volumes:
    - ./nullmailer:/etc/nullmailer
  restart: always
```

## Up and Running


```bash
# start service
$ cd ~/fig/nullmailer
$ docker-compose up -d

# send email (from gmail to yahoo)
$ alias sendmail='docker exec -i nullmailer sendmail -f username@gmail.com'
$ echo -e 'Subject: hello\r\n\r\nworld' | sendmail username@yahoo.com
```

[1]: http://untroubled.org/nullmailer/
[2]: http://raspberry.znix.com/2013/03/nullmailer-on-raspberry-pi.html
