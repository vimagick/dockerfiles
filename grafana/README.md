grafana
=======

![](https://badge.imagelayers.io/vimagick/grafana:latest.svg)

[Grafana][1] is a leading open source application for visualizing large-scale
measurement data.

## docker-compose.yml

```yaml
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
  restart: always
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
