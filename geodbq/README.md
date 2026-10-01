geodbq
======

[geodbq][1] is a lightweight command-line tool to inspect and query geoip.dat and geosite.dat files used by Xray-core.

```bash
$ alias geodbq="docker run --rm easypi/geodbq"
$ source <(geodbq completion bash)
$ geodbq ip 8.8.8.8
$ geodbq domain youtube.com
# generate blocked-names.txt for dnscrypt-proxy
$ geodbq list-rules CATEGORY-NETDISK-CN | awk '$2=="[domain]"{print $3}$2=="[full]"{print "="$3}'
# generate forwarding-rules.txt for dnscrypt-proxy
$ geodbq list-rules CN | awk '$2=="[domain]" || $2=="[full]" {print $3"\t223.5.5.5"}'
```

[dnscrypt-proxy.toml][2]:
- [blocked-names.txt][3]
- [forwarding-rules.txt][4]

[1]: https://github.com/Wanwire/Geodbq
[2]: https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml
[3]: https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-blocked-names.txt
[4]: https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-forwarding-rules.txt