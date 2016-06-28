ocserv
======

[OpenConnect server][1] (ocserv) is an SSL VPN server. Its purpose is to be a
secure, small, fast and configurable VPN server.

## docker-compose.yml

```yaml
ocserv:
  image: vimagick/ocserv
  ports:
    - "4443:443/tcp"
    - "4443:443/udp"
  environment:
    - VPN_DOMAIN=vpn.easypi.info
    - VPN_NETWORK=10.20.30.0
    - VPN_NETMASK=255.255.255.0
    - VPN_USERNAME=username
    - VPN_PASSWORD=password
  cap_add:
    - NET_ADMIN
  restart: always
```

[1]: http://www.infradead.org/ocserv/
