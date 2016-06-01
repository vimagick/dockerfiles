grafana
=======

![](https://badge.imagelayers.io/vimagick/grafana:latest.svg)

[Grafana][1] is a leading open source application for visualizing large-scale
measurement data.

## docker-compose.yml

```yaml
grafana:
  image: vimagick/grafana
  ports:
    - "3000:3000"
  environment:
    - GF_SERVER_ROOT_URL=http://grafana.easypi.info/
    - GF_SECURITY_ADMIN_USER=admin
    - GF_SECURITY_ADMIN_PASSWORD=admin
  restart: always
```

## up and running

```
$ docker-compose up -d
$ docker-compose exec grafana bash
>>> cat /etc/grafana/grafana.ini
>>> grafana-cli plugins install grafana-worldmap-panel
>>> exit
$ docker-compose restart
$ firefox http://localhost:3000/
```

[1]: http://grafana.org/
