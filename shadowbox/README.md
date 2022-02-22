shadowbox
=========

## up and running

```bash
$ mkdir -p data/{certs,state}
$ cd data/certs/
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/CN=localhost' -keyout easypi.key -out easypi.crt
$ openssl x509 -in easypi.crt -noout -sha256 -fingerprint | cut -d= -f2 | tr -d :
$ docker-compose up -d
$ curl -s -k https://127.0.0.1:8081/easypi/access-keys
```

## remote management

```bash
$ ssh -N -L 8081:localhost:8081 remote-server
$ open -a 'Outline Manager'
```

API: <https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/shadowbox/server/api.yml>
