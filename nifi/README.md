nifi
====

[Apache nifi][1] is an easy to use, powerful, and reliable system to process
and distribute data.

![](https://nifi.apache.org/assets/images/flow-th.png)

## up and running

```bash
$ mkdir -p data/nifi/{conf,database_repository,flowfile_repository,content_repository,provenance_repository,state,logs,nar_extensions,python_extensions}
$ mkdir -p data/registry/{database,flow_storage,logs}
$ chown -R 1000:1000 data
$ tree data
├── nifi
│   ├── conf
│   ├── content_repository
│   ├── database_repository
│   ├── flowfile_repository
│   ├── logs
│   ├── nar_extensions
│   ├── provenance_repository
│   ├── python_extensions
│   └── state
└── registry
    ├── database
    ├── flow_storage
    └── logs

$ docker-compose up -d
$ curl -k --resolve nifi:8443:127.0.0.1 https://nifi:8443/nifi/
$ open https://nifi:8443/nifi/#/login
$ curl http://127.0.0.1:18080/nifi-registry/
```

[1]: https://nifi.apache.org
