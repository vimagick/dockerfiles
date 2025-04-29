nifi-minifi-cpp
===============

```bash
$ mkdir -p data/{conf,logs}
$ chown -R 1000:1000 data
$ docker compose up -d
$ wget -O data/conf/config.yml https://github.com/apache/nifi-minifi-cpp/raw/refs/heads/main/examples/mqtt_config.yml
$ vim data/conf/config.yml
  - change /tmp/input to /tmp
  - use your own mqtt server
$ docker compose restart
$ docker compose exec nifi-mini-cpp sh
>>> echo hello > /tmp/x.txt
```
