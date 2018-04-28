odoo
====

[Odoo][1] is a suite of web based open source business apps.

## docker-compose.yml

```yaml
odoo:
  image: odoo:11.0
  ports:
    - "8069:8069"
  volumes:
    - ./data/odoo:/var/lib/odoo
    - ./data/addons:/mnt/extra-addons
  links:
    - postgres:db
  restart: always

postgres:
  image: postgres:9-alpine
  volumes:
    - ./data/postgres:/var/lib/postgresql/data
  environment:
    - POSTGRES_USER=odoo
    - POSTGRES_PASSWORD=odoo
  restart: always
```

## up and running

```bash
$ mkdir -m 777 -p data/odoo
$ docker-compose up -d
$ docker-compose exec postgres psql -U postgres
postgres=# \l
postgres=# drop database odoo;
postgres=# \q
$ curl http://localhost:8069
```

[1]: https://www.odoo.com
