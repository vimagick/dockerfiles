fteproxy
========

[fteproxy][1] provides transport-layer protection to resist keyword filtering,
censorship and discriminatory routing policies.

Its job is to relay datastreams, such as web browsing traffic,
by encoding streams as messages that match a user-specified regular expression.

fteproxy is fast, free, open source, and cross platform. 
It works very well with [vimagick/openvpn][2](TCP mode).

In the following example, I will setup a server/client pair to connect www.google.com:80.

## Internet Censorship

### The problem

![before](https://fteproxy.org/images/withoutfte.png)

### The solution

![after](https://fteproxy.org/images/withfte.png)

## Create a docker-compose.yml

```yaml
version: "3.8"

services:

  server:
    image: vimagick/fteproxy
    ports:
      - "4911:4911"
    environment:
      - MODE=server
      - SERVER_IP=0.0.0.0
      - SERVER_PORT=4911
      - PROXY_IP=openvpn
      - PROXY_PORT=1194
      - KEY=66754b8113ea7a218b7613f73f7e13b1e91790216f659b5f78b903b34c654741
    extra_hosts:
      - openvpn:1.2.3.4
    restart: unless-stopped

  client:
    image: vimagick/fteproxy
    ports:
      - "1194:1194"
    environment:
      - MODE=client
      - SERVER_IP=openvpn.easypi.pro
      - SERVER_PORT=4911
      - CLIENT_IP=0.0.0.0
      - CLIENT_PORT=1194
      - KEY=66754b8113ea7a218b7613f73f7e13b1e91790216f659b5f78b903b34c654741
    restart: unless-stopped
```

You need to split the docker-compose.yml into two parts:

- server: to mask a tcp service
- client: to unmask the service

> To generate random key:  
> `xxd -u -p -c32 /dev/urandom | head -n1`

## Run fteproxy server/client

```bash
$ docker-compose up -d
Creating fteproxy_server_1...
Creating fteproxy_client_1...

$ docker-compose ps
Name                     Command               State           Ports
----------------------------------------------------------------------------------
fteproxy_client_1   /bin/sh -c /fteproxy/ftepr ...   Up      0.0.0.0:9009->80/tcp
fteproxy_server_1   /bin/sh -c /fteproxy/ftepr ...   Up      0.0.0.0:32768->80/tcp
```

## Test with curl

```html
$ curl http://localhost:9009/
<HTML><HEAD><meta http-equiv="content-type" content="text/html;charset=utf-8">
<TITLE>302 Moved</TITLE></HEAD><BODY>
<H1>302 Moved</H1>
The document has moved
<A HREF="http://www.google.com/">here</A>.
</BODY></HTML>
```

[1]: https://fteproxy.org/
[2]: https://hub.docker.com/r/vimagick/openvpn/
