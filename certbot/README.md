certbot
=======

[Let’s Encrypt][1] is a new Certificate Authority:
It’s free, automated, and open.

```bash
$ docker compose run --rm certbot

$ tree data/etc/live/
├── easypi.duckdns.org
│   ├── cert.pem -> ../../archive/easypi.duckdns.org/cert1.pem
│   ├── chain.pem -> ../../archive/easypi.duckdns.org/chain1.pem
│   ├── fullchain.pem -> ../../archive/easypi.duckdns.org/fullchain1.pem
│   ├── privkey.pem -> ../../archive/easypi.duckdns.org/privkey1.pem
│   └── README
└── README

$ docker compose run --rm renew
```

- ssl_certificate: fullchain.pem
- ssl_certificate_key: privkey.pem

[1]: https://letsencrypt.org/
