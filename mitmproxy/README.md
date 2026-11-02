mitmproxy
=========

[mitmproxy][1] is a free and open source interactive HTTPS proxy.

## quick start

```bash
$ alias mitmdump='docker run -t --rm -v $PWD:/data -w /data --network host mitmproxy/mitmproxy mitmdump'

$ mitmdump --mode socks5 --listen-port 1080
$ curl -x socks5h://127.0.0.1:1080 ipinfo.io/json

$ mitmdump --mode upstream:http://proxy-host:3128 --listen-port 8080
$ curl -x http://127.0.0.1:8080 ipinfo.io/json

$ mitmdump --mode reverse:https://httpbin.org:443@127.0.0.1:8080  -s data/demo.py
$ curl -X POST http://127.0.0.1:8080/post -d "foo=bar&baz=qux"

$ mitmdump --mode dns@5353 --set dns_name_servers=8.8.8.8
$ dig @127.0.0.1 -p5353 g.cn

# TODO: https://docs.mitmproxy.org/stable/howto/transparent/
$ mitmdump --mode transparent -p 1234 --showhost
```

> [!Tip]
> Read [this](https://github.com/mitmproxy/mitmproxy/tree/main/examples/contrib) to get more examples.

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

> [!Tip]
> Read [this](https://docs.mitmproxy.org/stable/concepts-certificates/) to install certificate globally.

[1]: https://mitmproxy.org/
