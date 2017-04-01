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
  environment:
    - OTR_HOST=iot.eclipse.org
    - OTR_PORT=1883
    - OTR_TOPICS=owntracks/username/#
    - OTR_OPTIONS=--browser-apikey XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  restart: always
```

Click [this][2] to generate a google map api key.

[1]: https://github.com/owntracks/recorder
[2]: https://developers.google.com/maps/documentation/javascript/?authuser=1
