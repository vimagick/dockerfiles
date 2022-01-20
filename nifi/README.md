nifi
====

[Apache nifi][1] is an easy to use, powerful, and reliable system to process
and distribute data.

![](https://nifi.apache.org/assets/images/flow-th.png)

## up and running

```bash
$ mkdir -p data/nifi/{conf,database_repository,flowfile_repository,content_repository,provenance_repository,state,logs}
$ mkdir -p data/registry/{database,flow_storage,logs}
$ chown -R 1000:1000 data

$ vi docker-compose.yml
    volumes:
      - ./data/nifi/conf:/tmp
      # ./data/nifi/conf:/opt/nifi/nifi-current/conf

$ docker-compose run --rm --entrypoint bash nifi
>>> cp /opt/nifi/nifi-current/conf/* /tmp
>>> exit

$ vi docker-compose.yml
    volumes:
      # ./data/nifi/conf:/tmp
      - ./data/nifi/conf:/opt/nifi/nifi-current/conf

$ docker-compose up -d
$ curl http://127.0.0.1:8080/nifi/
$ curl http://127.0.0.1:18080/nifi-registry/
```

Maybe there are better ways to populate a volume:

- named volumes
- anonymous volumes

[1]: https://nifi.apache.org
