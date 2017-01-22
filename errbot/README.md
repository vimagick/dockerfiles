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
$ docker-compose exec --user root errbot sh
>>> chmod 777 /usr/lib/python3.5/site-packages
>>> chmod 777 /usr/lib/python3.5/site-packages/__pycache__
>>> exit
```

Check the example config.py [here][2].

## chat-ops

```
master [8:50 PM] !tryme
errbot [8:50 PM] It works!

master [8:51 PM] !help
errbot [8:51 PM] All commands ...

master [8:52 PM] !whoami
errbot [8:52 PM]
┏━━━━━━━━━━┳━━━━━━━━━━━━━┓
┃ key      ┃ value       ┃
┡━━━━━━━━━━╇━━━━━━━━━━━━━┩
│ person   │ `@master`   │
├──────────┼─────────────┤
│ nick     │ `master`    │
├──────────┼─────────────┤
│ fullname │ `Mr Robot`  │
├──────────┼─────────────┤
│ client   │ `XXXXXXXXX` │
└──────────┴─────────────┘
```

[1]: http://errbot.io
[2]: http://errbot.io/en/latest/_downloads/config-template.py
