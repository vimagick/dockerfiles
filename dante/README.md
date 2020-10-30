Dante - A free SOCKS server
===========================

[Dante][1] is a product developed by Inferno Nettverk A/S. It consists of a
SOCKS server and a SOCKS client, implementing RFC 1928 and related standards.
It is a flexible product that can be used to provide convenient and secure
network connectivity. 

## docker-compose.yml

```yaml
version: "3.8"
services:
  dante:
    image: vimagick/dante
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
logoutput: stderr
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

socks pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
    #socksmethod: username
    log: error
}
```

## up and running

```bash
$ docker-compose up -d

# To enable username authentication, please uncomment `socksmethod: username`.
$ docker exec -it dante_dante_1 bash
>>> useradd username
>>> echo username:password | chpasswd
>>> exit

$ curl -x socks5h://username:password@127.0.0.1:1080 https://www.youtube.com
```

[1]: http://www.inet.no/dante/index.html
