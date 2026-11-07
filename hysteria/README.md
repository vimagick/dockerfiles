hysteria
========

[Hysteria][1] is powerful, lightning-fast, and censorship-resistant open-source proxy software.

## Server

```bash
$ mkdir -p data/ssl
$ vim data/server.yaml

$ openssl req -newkey rsa:2048 -nodes \
  -keyout data/ssl/server.key \
  -x509 -days 3650 -sha256 \
  -out data/ssl/server.crt \
  -subj "/C=US/ST=California/L=San Francisco/O=MyCompany/OU=IT/CN=example.com"

$ docker compose up -d server

# https://v2.hysteria.network/zh/docs/advanced/Traffic-Stats-API/
$ curl -s -H "Authorization: secret" http://127.0.0.1:9999/traffic
```

## Client

```bash
$ mkdir -p data
$ vim data/client.yaml

$ docker compose up -d client

$ curl -x socks5h://127.0.0.1:1080 https://ipinfo.io/json
$ curl -x http://127.0.0.1:3128 https://ipinfo.io/json
```

[1]: https://github.com/HyNetworks/hysteria
