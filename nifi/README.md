nifi
====

[Apache nifi][1] is an easy to use, powerful, and reliable system to process
and distribute data.

![](https://nifi.apache.org/assets/images/flow-th.png)


## up and running

```bash
$ mkdir -p data/nifi/{conf/archive,database_repository,flowfile_repository,content_repository,provenance_repository,state,logs}
$ mkdir -p data/registry/{database,flow_storage,logs}
$ chown -R 1000:1000 data
$ docker-compose up -d
$ curl http://127.0.0.1:8080/nifi/
$ curl http://127.0.0.1:18080/nifi-registry/
```

[1]: https://nifi.apache.org
