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
|          .     |                \       .
+----------+-----+                 +- Edge.
           ................................
```

## Supernode (1.2.3.4)

```bash
$ docker-compose up -d supernode
```

## Edge (192.168.1.23)

```bash
$ docker-compose up -d edge
$ sysctl -w net.ipv4.ip_forward=1
$ iptables -t nat -A POSTROUTING -o n2n0 -j MASQUERADE
```

## Client (192.168.1.45)

```bash
$ ip route add 192.168.100.0/24 via 192.168.1.23
```

[1]: https://www.ntop.org/products/n2n/
