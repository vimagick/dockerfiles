snort
=====

![](https://badge.imagelayers.io/vimagick/snort:latest.svg)

[`Snort`][1] is an open source intrusion prevention system capable of real-time
traffic analysis and packet logging.

```yaml
snort:
  image: vimagick/snort
  command: -q -c /etc/snort/snort.conf -A fast -y -i eth0
  volumes:
    - ./data/snort.conf:/etc/snort/snort.conf
    - ./data/rules:/etc/snort/rules
    - ./data/log:/var/log/snort
  cap_add:
    - NET_ADMIN
  net: host
  restart: unless-stopped
```

```bash
# /etc/snort/rules/local.rules
alert icmp any any -> any any (msg:"ICMP Echo Request"; itype:8; sid:10000;)
alert icmp any any -> any any (msg:"ICMP Echo Reply"; itype:0; sid:10001;)
```

```bash
$ docker-compose up -d

$ tail -f data/log/alert
snort_1  | 08/26/18-06:47:35.460754  [**] [1:10000:0] ICMP Echo Request [**] [Priority: 0] {ICMP} x.x.x.x -> y.y.y.y
snort_1  | 08/26/18-06:47:35.460835  [**] [1:10001:0] ICMP Echo Reply [**] [Priority: 0] {ICMP} y.y.y.y -> x.x.x.x

$ tcpdump -n -r data/log/snort.log.xxx
06:47:35.460754 IP x.x.x.x > y.y.y.y: ICMP echo request, id 17767, seq 933, length 12
06:47:35.460835 IP y.y.y.y > x.x.x.x: ICMP echo reply, id 17767, seq 933, length 12
```

[1]: https://snort.org/
