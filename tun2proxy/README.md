tun2proxy
=========

[tun2proxy][1] is a tunnel interface for HTTP and SOCKS proxies on Linux, Android, macOS, iOS and Windows.

## up and running

```bash
$ docker compose up -d

$ docker run --rm -it --network container:tun2proxy alpine:3.24
/ # apk update
/ # apk add curl
/ # curl ipinfo.io
/ # exit
```

[1]: https://github.com/tun2proxy/tun2proxy
