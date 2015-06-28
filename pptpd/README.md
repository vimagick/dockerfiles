pptpd
=====

This is still a work in progress, a successful connection has not been made.


## docker-compose.yml

```
pptpd:
  image: vimagick/pptpd
  volumes:
    - ./pptpd.conf:/etc/pptpd.conf
    - ./options.pptp:/etc/ppp/options.pptp
    - ./chap-secrets:/etc/ppp/chap-secrets
  net: host
  privileged: true
  restart: always
```

You must open the following ports:

- To allow PPTP tunnel maintenance traffic, open `1723/tcp`.
- To allow PPTP tunneled data to pass through router, open `Protocol 47`.

