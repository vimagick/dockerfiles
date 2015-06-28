pptpd
=====

## docker-compose.yml

```
pptpd:
  image: vimagick/pptpd
  volumes:
    - ./pptpd.conf:/etc/pptpd.conf
    - ./pptpd-options:/etc/ppp/pptpd-options
    - ./chap-secrets:/etc/ppp/chap-secrets
  privileged: true
  restart: always
  #net: host
```

## server

```
$ docker-compose up -d
```

> WARNING: YOU NEED TO REBOOT IF CONTAINER RESTARTED.

You must open the following ports:

- To allow PPTP tunnel maintenance traffic, open `1723/tcp`.
- To allow PPTP tunneled data to pass through router, open `Protocol 47`.


## firewall

If you use `net: host` for networking:

```
$ vim /etc/defautl/ufw
# DEFAULT_FORWARD_POLICY="ACCEPT"
$ ufw reload
$ ufw allow 1723
$ iptables -t nat -A POSTROUTING -s 192.168.127.0/24 -j MASQUERADE
```
