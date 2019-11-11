ggr-ui
======

[Ggr UI][1] is a standalone daemon that automatically collects `/status` information
from multiple Selenoid instances and returns it as a single `/status` API. When
this daemon is running you can use Selenoid UI to see the state of the entire
cluster.

```bash
$ docker-compose up -d
$ docker run --rm -it alpine sh
>>> apk update
>>> apk add bind-tools
>>> dig tasks.selenoid
```

```bash
$ curl http://127.0.0.1:8888/ping
$ curl http://127.0.0.1:8888/status
```

[1]: https://github.com/aerokube/ggr-ui

