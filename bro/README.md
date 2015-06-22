`Bro` is a powerful system that on top of the functionality it provides out of
the box, also offers the flexibility to customize analysis pretty much
arbitrarily. We provide a range of documentation material ranging from
introductory material to get you started, to full references of Bro’s various
frameworks.

## docker-compose.yml

```
bro:
  image: vimagick/bro
  command: bro -i eth0
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
