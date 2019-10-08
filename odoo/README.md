odoo
====

[Odoo][1] is a suite of web based open source business apps.

## docker-compose.yml

```yaml
odoo:
  image: odoo:12
  ports:
    - "127.0.0.1:8069:8069"
  volumes:
    - ./data/config:/etc/odoo
    - ./data/web:/var/lib/odoo
    - ./data/addons:/mnt/extra-addons
  links:
    - postgres:db
  restart: always

postgres:
  image: postgres:11-alpine
  volumes:
    - ./data/postgres:/var/lib/postgresql/data
  environment:
    - POSTGRES_DB=postgres
    - POSTGRES_USER=odoo
    - POSTGRES_PASSWORD=odoo
  restart: always
```

## up and running

```bash
$ mkdir -m 777 -p data/web
$ docker-compose up -d
$ curl http://localhost:8069
```

> Create a database: odoo

[1]: https://www.odoo.com
