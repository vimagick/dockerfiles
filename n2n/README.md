n2n
===

[n2n][1] is a layer-two peer-to-peer virtual private network (VPN) which allows
users to exploit features typical of P2P applications at network instead of
application level.

```
           .............VPN................
+------LAN-+-----+                 +- Edge.
|          .     |                /       .
| Client ->.Edge +-> Supernode <-+- Edge  .
|          .     |    (Edge)      \       .
+----------+-----+                 +- Edge.
           ................................
```

## Supernode/Edge (eth0:1.2.3.4, n2n0:192.168.100.1/24)

```bash
# start supernode & edge
$ docker-compose up -d
$ ifconfig
  eth0: 1.2.3.4
  br-2e0238bf6b9d: 172.20.0.1

# config edge routing
$ docker-compose exec edge bash
>>> ifconfig
    eth0: 172.20.0.2
    n2n0: 192.168.100.1
>>> iptables -t nat -A POSTROUTING -j MASQUERADE
>>> exit

# get bridge ip
$ ip route get 192.168.200.1
192.168.200.1 via 172.20.0.2 dev br-2e0238bf6b9d  src 172.20.0.1

# add vpn route (via edge's n2n0)
$ ip route add 192.168.200.0/24 via 172.20.0.2
$ ping 192.168.200.1
```

## Edge (eth0:192.168.1.23/24, n2n0:192.168.100.x/24)

```bash
$ docker-compose up -d edge
$ sysctl -w net.ipv4.ip_forward=1
$ iptables -t filter -A FORWARD -j ACCEPT
$ iptables -t nat -A POSTROUTING -o n2n0 -j MASQUERADE
```

## Client (eth0:192.168.1.45/24)

```bash
$ ip route add 192.168.100.0/24 via 192.168.1.23
$ ping 192.168.100.1
$ nmap -sP 192.168.100.0/24
```

> Static routes can be added on your home router.

[1]: https://www.ntop.org/products/n2n/
