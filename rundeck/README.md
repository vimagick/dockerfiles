rundeck
=======

[Rundeck Community][1] Turn your operations procedures into self-service jobs.
Safely give others the control and visibility they need.

## docker-compose.yml

```yaml
rundeck:
  image: rundeck/rundeck:3.0.22
  ports:
    - "4440:4440"
  volumes:
    - ./data/ssh:/home/rundeck/.ssh
    - ./data/rundeck:/home/rundeck/server/data
  environment:
    - RUNDECK_SECURITY_HTTPHEADERS_ENABLED=false
  mem_limit: 1024m
  restart: always
```

Read [this][2] to use more environment variables.

## up and running

```bash
$ mkdir -p data/{rundeck,ssh,postgres}
$ chown -R 1000:1000 data
$ chmod 700 data/ssh
$ docker-compose up -d
$ curl http://127.0.0.1:4440
```

[1]: https://www.rundeck.com/open-source
[2]: https://github.com/rundeck/rundeck/tree/master/docker/official
