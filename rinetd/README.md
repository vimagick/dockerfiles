rinetd
======

[rinetd][1] is used to efficiently redirect connections from one IP
address/port combination to another. It is useful when operating virtual
servers, firewalls and the like.

## docker-compose.yml

```yaml
version: "3.8"
services:
  rinetd:
    image: vimagick/rinetd
    volumes:
      - ./data:/etc/rinetd
    network_mode: host
    restart: unless-stopped
```

## up and running

```bash
$ docker-compose up -d
$ dig @127.0.0.1 -p 5353 google.com +short
$ docker-compose logs
```

[1]: https://github.com/samhocevar/rinetd
