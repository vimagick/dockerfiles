semaphore-arm64
===============

## up and running

```bash
$ docker-compose run --rm semaphore bash
>>> semaphore user add --admin --login admin --name admin --password admin --email admin@example.com
>>> git config --global pull.ff only
>>> exit
$ docker-compose up -d
$ curl http://localhost:3000
```
