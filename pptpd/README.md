pptpd
=====

This is still a work in progress, a successful connection has not been made.


## docker-compose.yml

```
pptpd:
  image: vimagick/pptpd
  volumes:
    - ./pptpd.conf:/etc/pptpd.conf
    - ./pptpd-options:/etc/ppp/pptpd-options
    - ./chap-secrets:/etc/ppp/chap-secrets
  net: host
  privileged: true
  restart: always
```

## server

```
$ docker-compose up -d
$ iptables -t filter -I INPUT -p tcp --dport 1723 -j ACCEPT
$ iptables -t filter -I INPUT -p 47 -j ACCEPT
$ iptables -t nat -I POSTROUTING -s 192.168.127.0/24 -j MASQUERADE
```

You must open the following ports:

- To allow PPTP tunnel maintenance traffic, open `1723/tcp`.
- To allow PPTP tunneled data to pass through router, open `Protocol 47`.

