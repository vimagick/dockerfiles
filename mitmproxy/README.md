mitmproxy
=========

[mitmproxy][1] is a free and open source interactive HTTPS proxy.

## quick start

```bash
$ alias mitmdump='docker run --rm -v $PWD:/data -w /data --network host mitmproxy/mitmproxy mitmdump'
$ mitmdump --mode reverse:https://httpbin.org:443@127.0.0.1:8080  -s data/demo.py
$ curl -X POST http://127.0.0.1:8080/post -d "foo=bar&baz=qux"
{
  "headers": {
    "Content-Type": "application/json",
    "User-Agent": "curl/7.88.1"
  },
  "method": "POST",
  "url": "https://httpbin.org/post",
  "json": {
    "baz": "qux",
    "foo": "bar"
  }
}
```

## up and running

```bash
$ docker-compose up -d
$ curl --proxy 127.0.0.1:8080 --cacert data/mitmproxy-ca-cert.pem https://www.google.com
$ curl https://127.0.0.1:8443/headers
{
  "headers": {
    "Accept": "*/*",
    "Host": "httpbin.org",
    "User-Agent": "curl/7.88.1"
  }
}
```

> To install certificate globally, please read [this][2].

[1]: https://mitmproxy.org/
[2]: https://docs.mitmproxy.org/stable/concepts-certificates/
