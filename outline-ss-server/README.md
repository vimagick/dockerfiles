outline-ss-server
=================

The [Outline Shadowsocks service][1] allows for:

- Multiple users on a single port.
    - Does so by trying all the different credentials until one succeeds.
- Multiple ports
- Whitebox monitoring of the service using prometheus.io
    - Includes traffic measurements and other health indicators.
- Live updates via config change + SIGHUP
- Replay defense (add `--replay_history 10000`).

## up and running

```bash
$ docker compose up -d
$ curl -s http://127.0.0.1:9092/metrics
```

[1]: https://github.com/Jigsaw-Code/outline-ss-server
