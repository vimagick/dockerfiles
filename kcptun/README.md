kcptun
======

[kcptun][1] is an extremely simple & fast udp tunnel based on kcp protocol.

## How It Works

![][2]

## docker-compose.yml

```yaml
server:
  image: vimagick/kcptun
  command:
    --listen :29900
    --target google-public-dns-a.google.com:53
  ports:
    - "29900:29900/udp"
  environment:
    - KCPTUN_KEY=******
  restart: always

client:
  image: vimagick/kcptun
  entrypoint: client_linux_amd64
  command:
    --localaddr :12948
    --remoteaddr easypi.info:29900
  ports:
    - "12948:12948/tcp"
  environment:
    - KCPTUN_KEY=******
  restart: always
```

## Server Setup

```bash
$ docker-compose up -d server
$ docker-compose logs -f server
```

## Client Setup

```bash
$ docker-compose up -d client
$ docker-compose logs -f client
$ dig @127.0.0.1 -p 12948 www.google.com +tcp
```

[1]: https://github.com/xtaci/kcptun
[2]: https://github.com/xtaci/kcptun/raw/master/kcptun.png
