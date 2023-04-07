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

## [forwarding_rules][2]

```bash
$ wget -P data https://github.com/felixonmars/dnsmasq-china-list/raw/master/accelerated-domains.china.conf
$ cat data/accelerated-domains.china.conf | sed -e 's@^server=/\(.*\)/@\1\t@' | column -t > data/forwarding-rules.txt
```

[1]: https://github.com/DNSCrypt/dnscrypt-proxy
[2]: https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Forwarding
