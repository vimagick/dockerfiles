wireproxy
=========

[wireproxy][1] is a completely userspace application that connects to a
wireguard peer, and exposes a socks5/http proxy or tunnels on the machine.

```bash
$ docker compose up -d
$ curl -x socks5h://127.0.0.1:1080 ipinfo.io
$ curl -x 127.0.0.1:3128 ipinfo.io
$ curl 127.0.0.1:9080/metrics
```

Click [here][2] to get a free wireguard account.

[1]: https://github.com/pufferffish/wireproxy
[2]: https://opentunnel.net/wireguard/
