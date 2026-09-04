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

## docker-compose.yml

```yaml
services:
  outline-ss-server:
    image: easypi/outline-ss-server
    ports:
      - "8388:8388/tcp"
      - "8388:8388/udp"
      - "9092:9092/tcp"
    volumes:
      - ./data:/app/etc
    restart: unless-stopped
```

## up and running

```bash
$ docker compose up -d
$ curl -s http://127.0.0.1:9092/metrics
```

[1]: https://github.com/Jigsaw-Code/outline-ss-server
