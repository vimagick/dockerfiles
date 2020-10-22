postgres
========

![](https://www.postgresql.org/media/img/docs/hdr_logo.png)

## docker-compose.yml

```yaml
postgres:
  image: postgres:alpine
  ports:
    - "5432:5432"
  volumes:
    - ./data:/var/lib/postgresql/data
  environment:
    - POSTGRES_USER=postgres
    - POSTGRES_PASSWORD=postgres
    - POSTGRES_DB=postgres
  restart: unless-stopped
```

## up and running

```bash
$ docker-compose up -d

$ docker-compose exec postgres psql -U postgres postgres
>>> SELECT CURRENT_TIMESTAMP;
              now
-------------------------------
 2016-12-07 01:44:29.872928+00
(1 row)

>>> \?
>>> \d
>>> \q
```
