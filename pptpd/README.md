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
```

## server

```
$ docker-compose up -d
```

> WARNING: YOU NEED TO REBOOT IF CONTAINER RESTARTED.

You must open the following ports:

- To allow PPTP tunnel maintenance traffic, open `1723/tcp`.
- To allow PPTP tunneled data to pass through router, open `Protocol 47`.

