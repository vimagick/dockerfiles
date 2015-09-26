iptables
========

- iptables: filter ports
- tc: control traffic

## docker-compose.yml

```
shadowsocks:
  image: vimagick/shadowsocks-libev
  environment:
    - DNS_ADDR=8.8.8.8
    - METHOD=chacha20
    - PASSWORD=GUB61zGB2
  net: container:iptables
  restart: always

iptables:
  image: vimagick/iptables
  ports:
    - "8388:8388"
  environment:
    - TCP_PORTS=80,443
    - UDP_PORTS=53
    - RATE=4mbit
    - BURST=4mbit
  cap_add:
    - NET_ADMIN
  restart: always
```
