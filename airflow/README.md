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
$ python -c 'from cryptography.fernet import Fernet; print(Fernet.generate_key().decode())'
4XHGZH0dZ40iOv6z5cyfrXVg5qg3s_d06A7BFfbSsqA=

$ docker stack deploy -c docker-stack.yaml airflow
$ docker service update --replicas-max-per-node=1 airflow_worker
$ docker service update --replicas 3 airflow_worker

$ curl http://localhost:8080/
$ curl http://localhost:5555/
```

> :warning: This docker image was built with a static `FERNET_KEY` environment variable.
> You should set another value to it in `docker-stack.yaml`.
