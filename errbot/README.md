errbot
======

![](http://errbot.io/en/latest/_static/errbot.png)

[Errbot][1] is a chatbot, a daemon that connects to your favorite chat service
and brings your tools into the conversation.

## docker-compose.yml

```yaml
errbot:
  image: vimagick/errbot
  volumes:
    - ./data:/home/errbot
  tty: yes
  restart: always
```

## up and running

```bash
$ mkdir -m 777 data
$ docker-compose run --rm errbot --init
$ vim data/config.py
$ docker-compose up -d
```

## chat-ops

```
master [8:50 PM] !tryme
errbot [8:50 PM] It works!

master [8:50 PM] !help
errbot [8:50 PM] All commands ...

master [8:55 PM] !uptime
errbot [8:55 PM] I've been up for 6 minutes
```

[1]: http://errbot.io
