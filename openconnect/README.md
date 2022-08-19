openconnect
===========

![](https://badge.imagelayers.io/vimagick/openconnect:latest.svg)

[OpenConnect][1] is an SSL VPN client initially created to support Cisco's
AnyConnect SSL VPN. It has since been ported to support the Juniper SSL VPN
which is now known as Pulse Connect Secure.

## up and running

```bash
$ cd ~/fig/openconnect/
$ tree
.
├── data/
│   ├── certs/
│   │   └── client.p12
│   └── openconnect.conf
├── docker-compose.yml
├── Dockerfile
└── README.md

$ cd ./data/certs/
$ openssl pkcs12 -in client.p12 -nodes -cacerts -out ca-cert.pem
$ openssl pkcs12 -in client.p12 -nodes -clcerts -out client-cert.pem
$ openssl pkcs12 -in client.p12 -nodes -nocerts -out client-key.pem

$ docker-compose up -d
$ docker-compose logs -f

$ ip link show
$ ip addr show
$ ip route show

$ curl ifconfig.co
$ curl ifconfig.ovh
$ curl ifconfig.me
```
[1]: http://www.infradead.org/openconnect/index.html
