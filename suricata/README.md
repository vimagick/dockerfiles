suricata
========

[Suricata][1] is a network Intrusion Detection System, Intrusion Prevention System and Network Security Monitoring engine developed by the OISF and the Suricata community.

```bash
$ docker compose run --rm suricata suricata-update -f
$ docker compose up -d
$ tail -f data/log/fast.log
$ curl http://testmynids.org/uid/index.html
$ docker compose exec suricata logrotate -vf /etc/logrotate.d/suricata
```

[1]: https://github.com/OISF/suricata
