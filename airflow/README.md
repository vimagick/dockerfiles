airflow
=======

## How It Works

```
                   +---------+
              +--> | Worker1 |
 redis        |    +---------+
 postgres     |
+--------+    |    +---------+
| Master | <--+--> | Worker2 |
+--------+    |    +---------+
 webserver    |
 scheduler    |    +---------+
 flower       +--> | Worker3 |
                   +---------+
```

## Quick Start

```bash
# On Master
$ docker-compose up -d
$ chmod 777 data/airflow/dags
$ docker-compose exec webserver cp -r /usr/local/lib/python3.6/site-packages/airflow/example_dags dags

# On Workers
$ docker-compose up -d
$ chmod 777 data/airflow/dags
$ docker-compose exec worker cp -r /usr/local/lib/python3.6/site-packages/airflow/example_dags dags
```
