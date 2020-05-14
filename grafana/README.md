grafana
=======

![](https://badge.imagelayers.io/vimagick/grafana:latest.svg)

[Grafana][1] is a leading open source application for visualizing large-scale
measurement data.

As an alternative to installing and running the image renderer as a plugin you
can run it as a remote image rendering service using [Docker][3].

[Installing using Docker][2]

## docker-compose.yml

```yaml
version: "3.8"

services:

  grafana:
    image: grafana/grafana
    ports:
      - "3000:3000"
    volumes:
      - ./data:/var/lib/grafana
    environment:
      - GF_SERVER_ROOT_URL=http://grafana.example.com:3000/
      - GF_SECURITY_ADMIN_USER=admin
      - GF_SECURITY_ADMIN_PASSWORD=admin
      - GF_SMTP_ENABLED=true
      - GF_SMTP_HOST=smtp.gmail.com:587
      - GF_SMTP_USER=grafana@example.com
      - GF_SMTP_FROM_ADDRESS=grafana@example.com
      - GF_SMTP_PASSWORD=******
      - GF_USERS_ALLOW_SIGN_UP=false
      - GF_ALERTING_ERROR_OR_TIMEOUT=keep_state
      - GF_RENDERING_SERVER_URL=http://renderer:8081/render
      - GF_RENDERING_CALLBACK_URL=http://grafana:3000/
    restart: unless-stopped

  renderer:
    image: grafana/grafana-image-renderer
    ports:
      - "8081:8081"
    environment:
      - ENABLE_METRICS=true
      - BROWSER_TZ=Asia/Shanghai
    restart: unless-stopped
```

## up and running

```bash
$ mkdir data
$ chmod 777 data
$ docker-compose up -d
$ docker-compose exec grafana bash
>>> cat /etc/grafana/grafana.ini
>>> grafana-cli plugins install grafana-worldmap-panel
>>> exit
$ docker-compose restart
$ curl http://localhost:3000/
```

[1]: http://grafana.org/
[2]: http://docs.grafana.org/installation/docker/
[3]: https://github.com/grafana/grafana-image-renderer/blob/master/docs/remote_rendering_using_docker.md
