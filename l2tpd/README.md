l2tpd
=====

[l2tpd][1] (Layer 2 Tunneling Protocol daemon) is an open-source software implementation of the Layer 2 Tunneling Protocol (L2TP, RFC 2661) designed to tunnel Point-to-Point Protocol (PPP) sessions over UDP. Its modern, actively maintained fork is known as xl2tpd.

```bash
$ mkdir -p data/{ipsec,ppp,xl2tpd}
$ tree
├── data
│   ├── ipsec
│   │   ├── ipsec.conf
│   │   └── ipsec.secrets
│   ├── ppp
│   │   ├── chap-secrets
│   │   └── options.xl2tpd
│   └── xl2tpd
│       └── xl2tpd.conf
└── docker-compose.yml
$ docker compose up -d
```

[1]: https://github.com/xelerance/xl2tpd