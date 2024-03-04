maltrail
========

[Maltrail][1] is a malicious traffic detection system.


```bash
$ docker compose up -d
$ curl http://127.0.0.1:8338

$ ping -c 1 136.161.101.53
$ nslookup morphed.ru

$ tail -f ./data/log/$(date +"%Y-%m-%d").log
```

[1]: https://github.com/stamparm/maltrail
