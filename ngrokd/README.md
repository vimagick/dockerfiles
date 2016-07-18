ngrokd
======

![](https://badge.imagelayers.io/vimagick/ngrokd:latest.svg)

[ngrok][1] is a reverse proxy that creates a secure tunnel from a public endpoint to
a locally running web service. ngrok captures and analyzes all traffic over the
tunnel for later inspection and replay.

## docker-compose.yml

```
data:
  build: .
  entrypoint: /bin/true

service:
  image: debian:jessie
  command: >
    ./ngrokd
    -domain=ngrok.easypi.info
    -httpAddr=:2080
    -httpsAddr=:2443
    -tunnelAddr=:4443
    -tlsCrt=snakeoil.crt
    -tlsKey=snakeoil.key
    -log-level=INFO
  ports:
    - "2080:2080"
    - "2443:2443"
    - "4443:4443"
  volumes:
    - ./ngrok:/ngrok
  working_dir: /ngrok
  restart: always
```

## up and running

```
$ mkdir -p ~/fig/ngrokd/
$ cd ~/fig/ngrokd/
$ wget https://github.com/vimagick/dockerfiles/raw/master/ngrokd/docker-compose.yml
$ wget https://github.com/vimagick/dockerfiles/raw/master/ngrokd/Dockerfile
$ vim Dockerfile

$ docker-compose build data
$ docker-compose up -d data
$ docker cp ngrokd_data_1:/ngrok .
$ docker-compose rm -v data
$ docker rmi ngrokd_data

$ docker-compose up -d service
$ docker-compose logs service
```

## important notes

- [vimagick/ngrokd][2] should not be used directly
- Change `NGROK_BASE_DOMAIN` in [Dockerfile][3]
- Nerver push it to public repo

## raspberry pi

```
/etc/ngrok/
├── conf.d/
│   ├── router.json
│   └── webcam.json
└── ngrok.yml
```

```
{
  "name": "router",
  "proto": "http",
  "addr": "192.168.1.1:80",
  "bind_tls": true,
  "inspect": false,
  "auth": "user:pass"
}
```

```yaml
# /etc/ngrok/ngrok.yml
authtoken: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
console_ui: false
region: ap
web_addr: 0.0.0.0:4040
tunnels:
  ssh:
    proto: tcp
    addr: 22
  web:
    proto: http
    addr: 4040
    bind_tls: true
    inspect: false
    auth: "user:pass"
```

```ini
# /etc/systemd/system/ngrok.service
[Unit]
Description=Secure Tunnels To Localhost
Documentation=https://ngrok.com/docs
After=network.target

[Service]
ExecStart=/usr/bin/ngrok start --config /etc/ngrok/ngrok.yml --log stdout --all
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
```

```ini
# /etc/systemd/system/ngrok@.service
[Unit]
Description=Ngrok Instance Daemon
Requires=ngrok.service
After=ngrok.service

[Service]
ExecStart=/usr/bin/curl -sS -X POST \
                        -H 'Content-Type: application/json' \
                        -d @/etc/ngrok/conf.d/%I.json \
                        http://127.0.0.1:4040/api/tunnels
ExecStop=/usr/bin/curl -sS -X DELETE http://127.0.0.1:4040/api/tunnels/%I
Restart=on-failure
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```

```bash
$ systemctl daemon-reload
$ systemctl start ngrok
$ systemctl enable ngrok

$ curl http://127.0.0.1:4040/api/tunnels/ssh
{"public_url": "tcp://0.tcp.ap.ngrok.io:19136"}
$ ssh -p 19136 root@0.tcp.ap.ngrok.io

$ systemctl start ngrok@router
$ curl http://127.0.0.1:4040/api/tunnels/router
{"public_url":"https://db45322c.ap.ngrok.io"}
$ w3m https://db45322c.ap.ngrok.io

$ systemctl status ngrok@*
```

## openwrt

```bash
#!/bin/sh /etc/rc.common

START=90
STOP=10

USE_PROCD=1

start_service() {
    procd_open_instance
    procd_set_param command /usr/bin/ngrok start --config /etc/ngrok.yml --all
    procd_set_param respawn 3600 5 0
    procd_close_instance
}
```

[1]: https://github.com/inconshreveable/ngrok
[2]: https://hub.docker.com/r/vimagick/ngrokd/
[3]: https://github.com/vimagick/dockerfiles/raw/master/ngrokd/Dockerfile#L9
