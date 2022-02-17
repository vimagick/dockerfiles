dnscrypt-proxy
==============

[dnscrypt-proxy][1] is a flexible DNS proxy, with support for modern encrypted
DNS protocols such as DNSCrypt v2, DNS-over-HTTPS, Anonymized DNSCrypt and ODoH
(Oblivious DoH).

## up and running

```bash
$ mkdir -p data
$ wget -O data/dnscrypt-proxy.toml https://github.com/DNSCrypt/dnscrypt-proxy/raw/master/dnscrypt-proxy/example-dnscrypt-proxy.toml
$ vim data/dnscrypt-proxy.toml
$ docker-compose up -d
$ dig @127.0.0.1 www.youtube.com
```

[1]: https://github.com/DNSCrypt/dnscrypt-proxy
