Dante - A free SOCKS server
===========================

[Dante][1] is a product developed by Inferno Nettverk A/S. It consists of a
SOCKS server and a SOCKS client, implementing RFC 1928 and related standards.
It is a flexible product that can be used to provide convenient and secure
network connectivity. 

## docker-compose.yml

```yaml
services:
  dante:
    image: easypi/dante
    ports:
      - "1080:1080"
    volumes:
      - ./data:/etc/dante
    tmpfs:
      - /run
    restart: unless-stopped
```

## sockd.conf

```
debug: 0
logoutput: stderr /var/log/dante/sockd.log
internal: 0.0.0.0 port = 1080
external: eth0
socksmethod: username none
clientmethod: none
user.privileged: root
user.unprivileged: nobody

client pass {
    from: 0.0.0.0/0 port 1-65535 to: 0.0.0.0/0
    log: error
}

socks block {
    from: 0.0.0.0/0 to: 127.0.0.0/8
    log: error
}

socks block {
    from: 0.0.0.0/0 to: 10.0.0.0/8
    log: error
}

socks block {
    from: 0.0.0.0/0 to: 172.16.0.0/12
    log: error
}

socks block {
    from: 0.0.0.0/0 to: 192.168.0.0/16
    log: error
}

socks pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
    #socksmethod: username
    log: error
}
```

> [!Caution]
> Block unauthorized LAN access is a good practice!

## up and running

```bash
$ mkdir -p data/{etc,log}
$ vim data/etc/sockd.conf

$ docker-compose up -d

# To enable username authentication, please uncomment `socksmethod: username`.
$ docker compose exec dante bash
>>> useradd -s /usr/sbin/nologin -M username
>>> echo username:password | chpasswd
>>> exit

$ curl -x socks5h://username:password@127.0.0.1:1080 https://www.youtube.com
```

[1]: http://www.inet.no/dante/index.html
