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

You can run a self-hosted wireguard server quickly with [mitmproxy][3]

```bash
$ mitmdump --mode wireguard --flow-detail 4
... client connect
... DNS QUERY (A) ipinfo.io
... << 34.117.186.192
... client connect
... server connect 34.117.186.192:80
... GET http://34.117.186.192/
... << 200 OK 254b
... client disconnect
... server disconnect 34.117.186.192:80
```

[1]: https://github.com/pufferffish/wireproxy
[2]: https://opentunnel.net/wireguard/
[3]: https://docs.mitmproxy.org/stable/concepts-modes/#wireguard-transparent-proxy
