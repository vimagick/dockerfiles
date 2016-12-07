postgres
========

![](https://www.postgresql.org/media/img/docs/hdr_logo.png)

## docker-compose.yml

```yaml
postgres:
  image: postgres:alpine
  ports:
    - "5432:5432"
  environment:
    - POSTGRES_USER=root
    - POSTGRES_PASSWORD=root
    - POSTGRES_DB=postgres
  restart: always
```

## up and running

```bash
$ docker-compose up -d

$ docker-compose exec postgres psql postgres
>>> SELECT CURRENT_TIMESTAMP;
              now
-------------------------------
 2016-12-07 01:44:29.872928+00
(1 row)

>>> \q
```
