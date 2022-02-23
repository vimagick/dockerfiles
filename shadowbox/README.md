shadowbox
=========

[Outline][1] makes it easy to create a VPN server, giving anyone access to the free and open internet.

## up and running

```bash
$ mkdir -p data/{certs,state}
$ cd data/certs/
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/CN=localhost' -keyout easypi.key -out easypi.crt
$ openssl x509 -in easypi.crt -noout -sha256 -fingerprint | cut -d= -f2 | tr -d :
$ docker-compose up -d
$ curl -s -k https://127.0.0.1:8081/easypi/server
$ curl -s -k https://127.0.0.1:8081/easypi/metrics/transfer
$ curl -s -k https://127.0.0.1:8081/easypi/access-keys
```

## remote management

```bash
$ ssh -N -L 8081:localhost:8081 remote-server
$ open -a 'Outline Manager'
```

Paste your installation output:

```json
{
  "apiUrl": "https://127.0.0.1:8081/easypi",
  "certSha256": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}
```

> `certSha256` is the fingerprint of your ssl certificate. :point_up:

API Doc: <https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/shadowbox/server/api.yml>

[1]: https://getoutline.org/
