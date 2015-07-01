The Bro Network Security Monitor
================================

[![](https://badge.imagelayers.io/vimagick/bro:latest.svg)](https://imagelayers.io/?images=vimagick/bro:latest 'Get your own badge on imagelayers.io')

`Bro` is a powerful network analysis framework that is much different from the
typical IDS you may know.

- Adaptable
- Efficient
- Flexible
- Forensics
- Commercially Supported
- In-depth Analysis
- Highly Stateful
- Open Interfaces
- Open Source

## docker-compose.yml

```
bro:
  image: vimagick/bro
  command: bro -C -i eth0
  volumes:
    - ./logs:/opt/bro/logs
  net: container:shadowsocks_shadowsocks_1
```

> We are going to monitor `shadowsocks` which is a socks5 server.

## up and running

```
$ cd ~/fig/bro/

$ docker-compose up -d

$ docker exec -it bro_bro_1 bash
>>> cat dns.log | bro-cut query | sort | uniq -c | sort -nr | head -5
    10 www.youtube.com
    3 twitter.com
    2 www.google.com
    1 www.baidu.com
    1 www.facebook.com
>>> exit
```

> Don't be evil!
