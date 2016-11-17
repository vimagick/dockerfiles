home-assistant
==============

## docker-compose.yml

```yaml
hass:
  image: vimagick/hass
  volumes:
    - ./data:/etc/hass
  net: host
  restart: unless-stopped
```

## up and running

```bash
$ docker-compose up -d
$ docker-compose logs -f
$ curl http://localhost:8123
```

> More python packages will be installed during startup.
