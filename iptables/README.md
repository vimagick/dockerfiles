iptables
========

![](https://badge.imagelayers.io/vimagick/iptables:latest.svg)

- _iptables_: filter ports (allow: 53/UDP, 80/TCP, 443/TCP)
- _tc_: control traffic via [tbf][1]

## docker-compose.yml

```
shadowsocks:
  image: vimagick/shadowsocks-libev
  environment:
    - DNS_ADDR=8.8.8.8
    - METHOD=chacha20
    - PASSWORD=9MLSpPmNt
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
    - BURST=4kb
  cap_add:
    - NET_ADMIN
  restart: always
```

## Up and Running

```
$ docker-compose up -d
Creating shadowsocks_iptables_1...
Creating shadowsocks_shadowsocks_1...

$ docker-compose logs
Every 60s: tc -s qdisc ls dev eth0                          2015-09-27 02:27:57
iptables_1    |
iptables_1    | qdisc tbf 8012: root refcnt 2 rate 4Mbit burst 4Kb lat 50.0ms
iptables_1    |  Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
iptables_1    |  backlog 0b 0p requeues 0
```

[1]: http://linux.die.net/man/8/tc-tbf
