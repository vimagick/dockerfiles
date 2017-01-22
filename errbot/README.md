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
    - /usr/lib/python3.5/site-packages
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
>>> apk add -U py3-lxml
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

## install plugins

```
master [8:53 PM] !repos update
errbot [8:53 PM] Start updating ... Done.

master [8:53 PM] !repos search nettools
errbot [8:53 PM]
┏━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━┓
┃ Status ┃ Name                    ┃ Description ┃
┡━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━┩
│        │ *errbotio/err-nettools* │ ...         │
└────────┴─────────────────────────┴─────────────┘

master [8:54 PM] !repos install errbotio/err-nettools
errbot [8:54 PM] Installing errbotio/err-nettools ... Done.

master [8:55 PM] !help nettools
errbot [8:55 PM] 
    *Nettools*
    _Various tools to query info about IPs, networks and domain names_
    • *!check rbl* - usage: check_rbl [-h] [-t THREADS] address
    • *!dig* - Call 'dig'
    • *!geoip* - usage: geoip [-h] address
    • *!host* - Call 'host'
    • *!nslookup* - Call 'nslookup'
    • *!whois* - usage: whois [-h] domain

master [8:56 PM] !whois www.youtube.com
errbot [8:56 PM] 
               name : youtube.com
    expiration_date : 2018-02-14 00:00:00-08:00
       last_updated : 2017-01-14 02:23:26-08:00
       name_servers : {'ns2.google.com', 'ns4.google.com', 'ns3.google.com', 'ns1.google.com'}
      creation_date : 2005-02-14 21:13:12-08:00
          registrar : MarkMonitor, Inc.
```

[1]: http://errbot.io
[2]: http://errbot.io/en/latest/_downloads/config-template.py
