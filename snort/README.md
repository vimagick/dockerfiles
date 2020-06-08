snort
=====

![](https://badge.imagelayers.io/vimagick/snort:latest.svg)

[Snort][1] is an open source intrusion prevention system capable of real-time
traffic analysis and packet logging.

```yaml
snort:
  image: vimagick/snort
  command: -q -c /etc/snort/snort.conf -y -i eth0
  volumes:
    - ./data/snort.conf:/etc/snort/snort.conf
    - ./data/u2json.conf:/etc/snort/u2json.conf
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

$ docker-compose exec snort idstools-u2json @/etc/snort/u2json.conf
INFO: Loaded 523 rule message map entries.
INFO: Loaded 38 classifications.

$ tail -f data/log/alert.json
{"type":"event","event":{"impact":0,"generator-id":1,"protocol":1,"dport-icode":0,"signature-revision":0,"classification-id":0,"signature-id":1000000,"sensor-id":0,"impact-flag":0,"sport-itype":8,"priority":0,"event-second":1591597954,"pad2":null,"destination-ip":"1.2.3.4","event-id":55,"mpls-label":null,"vlan-id":null,"source-ip":"5.6.7.8","event-microsecond":905105,"blocked":0}}
{"type":"event","event":{"impact":0,"generator-id":1,"protocol":1,"dport-icode":0,"signature-revision":0,"classification-id":0,"signature-id":1000001,"sensor-id":0,"impact-flag":0,"sport-itype":0,"priority":0,"event-second":1591597954,"pad2":null,"destination-ip":"5.6.7.8","event-id":56,"mpls-label":null,"vlan-id":null,"source-ip":"1.2.3.4","event-microsecond":905126,"blocked":0}}

$ while :; do inotifywait -q -e modify data/log/alert.json && play -q alert.wav; done
```

[1]: https://snort.org/
