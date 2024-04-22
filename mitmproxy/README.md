mitmproxy
=========

[mitmproxy][1] is a free and open source interactive HTTPS proxy.

```bash
$ docker-compose up -d

$ curl --proxy 127.0.0.1:8080 --cacert data/mitmproxy-ca-cert.pem https://www.google.com

$ curl https://localhost:8443/headers
{
  "headers": {
    "Accept": "*/*",
    "Host": "httpbin.org",
    "User-Agent": "curl/8.6.0"
  }
}
```

> To install certificate globally, please read [this][2].

[1]: https://mitmproxy.org/
[2]: https://docs.mitmproxy.org/stable/concepts-certificates/
