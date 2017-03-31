ot-recorder
===========

The [OwnTracks Recorder][1] is a lightweight program for storing and accessing
location data published via MQTT (or HTTP) by the OwnTracks apps.

## docker-compose.yml

```yaml
ot-recorder:
  image: vimagick/ot-recorder
  ports:
    - "8083:8083"
  volumes:
    - ./data:/var/spool/owntracks/recorder/store
  restart: always
```

[1]: https://github.com/owntracks/recorder
