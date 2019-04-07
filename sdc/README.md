datacollector
=============

[StreamSets Data Collector][1] - Continuous big data and cloud platform ingest infrastructure.


```bash
$ chmod 777 data
$ docker-compose up -d
$ docker-compose exec sdc id
uid=20159(sdc) gid=20159(sdc) groups=20159(sdc)
$ chown 20159:20159 data/*.properties
$ chmod 600 data/form-realm.properties
$ docker-compose restart
```

[1]: https://streamsets.com
