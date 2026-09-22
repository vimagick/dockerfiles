maltrail
========

[Maltrail][1] is a malicious traffic detection system.


```bash
$ mkdir -p data/{etc,log,var}
$ wget -P data/etc https://github.com/stamparm/maltrail/raw/refs/heads/master/maltrail.conf
$ vim data/etc/maltrail.conf
$ chown -R 10001:10001 data

$ docker compose up -d
$ curl http://127.0.0.1:8338 # admin:changeme!
$ curl http://127.0.0.1:9114/metrics

$ head data/etc/maltrail.csv
$ ping -c 1 136.161.101.53
$ nslookup morphed.ru

$ tail -f ./data/log/$(date +"%Y-%m-%d").log
```

[1]: https://github.com/stamparm/maltrail
