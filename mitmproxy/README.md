mitmproxy
=========

[mitmproxy][1] is a free and open source interactive HTTPS proxy.

```bash
$ docker-compose up -d
$ curl --proxy 127.0.0.1:8080 --cacert data/mitmproxy-ca-cert.pem https://www.google.com
```

[1]: https://mitmproxy.org/
