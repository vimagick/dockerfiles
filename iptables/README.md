iptables
========

![](https://badge.imagelayers.io/vimagick/iptables:latest.svg)

- iptables: filter ports (allow: 53/UDP, 80/TCP, 443/TCP)
- tc: control traffic via [tbf][1]

## Server

```bash
$ docker-compose up -d
[+] Running 3/3
 ⠿ Network iptables_default  Created
 ⠿ Container iptables        Started
 ⠿ Container shadowsocks     Started

$ docker-compose logs -f iptables
Every 60.0s: tc -s qdisc ls dev eth0                2021-12-15 09:55:38
iptables  |
iptables  | qdisc tbf 8004: root refcnt 2 rate 4Mbit burst 4Kb lat 50ms
iptables  |  Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
iptables  |  backlog 0b 0p requeues 0
```

## Client

```bash
$ ss-local -s x.x.x.x -p 8388 -b 0.0.0.0 -l 1080 -u -m chacha20-ietf-poly1305 -k ieZaid9soh
INFO: initializing ciphers...
INFO: listening at 0.0.0.0:1080
INFO: udprelay enabled

$ curl -x socks5h://127.0.0.1:1080 http://ifconfig.co
x.x.x.x

$ curl -x socks5h://127.0.0.1:1080 https://ifconfig.co
x.x.x.x

$ curl -x socks5h://127.0.0.1:1080 http://samsung.u-vis.com:8080
curl: (52) Empty reply from server
```

[1]: http://linux.die.net/man/8/tc-tbf
