ndscheduler
===========

[ndscheduler][1] is a flexible python library for building your own cron-like
system, with REST APIs and a Web UI.

```bash
$ mkdir -p data/jobs
$ touch data/jobs/__init__.py
$ wget -P data https://github.com/Nextdoor/ndscheduler/raw/v0.3.0/simple_scheduler/settings.py
$ wget -P data/jobs https://github.com/Nextdoor/ndscheduler/raw/v0.3.0/simple_scheduler/jobs/shell_job.py
$ docker-compose up -d
$ curl http://127.0.0.1:8888
```

[1]: https://github.com/Nextdoor/ndscheduler
