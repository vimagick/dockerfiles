airflow
=======

![](https://airflow.apache.org/_images/pin_large.png)

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
$ docker stack deploy -c docker-stack.yaml airflow
$ docker stack services airflow
$ docker service ps airflow_webserver
$ docker exec -it airflow_webserver.1.xxxxxx sh
>>> airflow create_user -r Admin -u admin -e admin@borderxlab.com -f Super -l Admin -p secret
>>> airflow list_users
╒══════╤════════════╤══════════════════════╤══════════════╤═════════════╤═════════╕
│   Id │ Username   │ Email                │ First name   │ Last name   │ Roles   │
╞══════╪════════════╪══════════════════════╪══════════════╪═════════════╪═════════╡
│    1 │ admin      │ admin@borderxlab.com │ Super        │ Admin       │ [Admin] │
╘══════╧════════════╧══════════════════════╧══════════════╧═════════════╧═════════╛
>>> exit

$ curl http://localhost:8080/
$ curl http://localhost:5555/
```

> :warning: You need to prepare nfs server with `airflow.cfg`.

```bash
$ python -c 'from cryptography.fernet import Fernet; print(Fernet.generate_key().decode())'
CD2wL7G0zt1SLuO4JQpLJuHtBaBEcXWKbQyvkvf2cZ8=
```

> :warning: You should set another value to `fernet_key` in `airflow.cfg` to improve security.
