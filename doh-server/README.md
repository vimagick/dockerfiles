doh-server
==========

[doh-server][1] is a fast, mature, secure DoH and ODoH server proxy written in Rust.

```bash
$ docker compose up -d
$ curl -s -H 'Accept: application/dns-json' 'http://127.0.0.1:8053/dns-query?name=google.com&type=A'
```

[1]: https://github.com/DNSCrypt/doh-server
