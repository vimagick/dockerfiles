healthchecks
============

[Healthchecks][1] is a cron job monitoring service. It listens for HTTP
requests and email messages ("pings") from your cron jobs and scheduled tasks
("checks"). When a ping does not arrive on time, Healthchecks sends out alerts.

## up and running

```bash
$ mkdir -m 777 data
$ docker-compose up -d
$ docker-compose exec healthchecks bash
>>> ./manage.py migrate
>>> ./manage.py createsuperuser
    Email address: admin@easypi.duckdns.org
    Password: ******
    Password (again): ******
    Superuser created successfully.
>>> exit
$ curl http://127.0.0.1:8000
```

[1]: https://github.com/healthchecks/healthchecks
