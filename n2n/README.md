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

# config edge routing
$ docker-compose exec edge bash
>>> ifconfig
>>> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>>> exit
```

## Edge (eth0:192.168.1.23/24, n2n0:192.168.100.x/24)

```bash
$ docker-compose up -d edge
$ sysctl -w net.ipv4.ip_forward=1
$ iptables -t nat -A POSTROUTING -o n2n0 -j MASQUERADE
```

## Client (eth0:192.168.1.45/24)

```bash
$ ip route add 192.168.100.0/24 via 192.168.1.23
$ ping 192.168.100.1
$ nmap -sP 192.168.100.0/24
```

[1]: https://www.ntop.org/products/n2n/
