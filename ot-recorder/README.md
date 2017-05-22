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
    - OTR_PORT=8883
    - OTR_USER=username
    - OTR_PASS=password
    - OTR_CAFILE=/etc/ssl/certs/DST_Root_CA_X3.pem
    - OTR_TOPICS=owntracks/#
    - OTR_BROWSERAPIKEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    - OTR_OPTIONS=--qos 0
  restart: always
```

You can pass any options to process via `OTR_OPTIONS` environment variable.

Click [this][2] to generate a google map api key.

[1]: https://github.com/owntracks/recorder
[2]: https://developers.google.com/maps/documentation/javascript/?authuser=1
