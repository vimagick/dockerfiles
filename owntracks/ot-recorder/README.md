ot-recorder
===========

The [OwnTracks Recorder][1] is a lightweight program for storing and accessing
location data published via MQTT (or HTTP) by the OwnTracks apps.

## docker-compose.yml

```yaml
version: "3.8"

services:

  recorder:
    image: vimagick/ot-recorder
    ports:
      - "8083:8083"
      - "8085:8085"
    volumes:
      - ./data:/var/spool/owntracks/recorder/store
    environment:
      - OTR_HOST=iot.eclipse.org
      - OTR_PORT=1883
      - OTR_USER=username
      - OTR_PASS=password
      - OTR_TOPICS=owntracks/#
      # OTR_CAPATH=/etc/ssl/certs/
      # OTR_OPTIONS=--debug
    restart: unless-stopped

  frontend:
    image: owntracks/frontend
    ports:
      - "8080:80"
    environment:
      - SERVER_HOST=recorder
      - SERVER_PORT=8083
    restart: unless-stopped
```

:warning: Some variables don't work (`OTR_QOS`, `OTR_CAFILE`) as [document][3] said.
You can pass any options to process via `OTR_OPTIONS` environment variable.

Click [this][2] to generate a google map api key.

## up and running

```bash
$ docker-compse up -d
$ docker-compose exec recorder bash
>>> ocat --list
{"results":["foo"]}
>>> ocat --user foo --device bar
```

[1]: https://github.com/owntracks/recorder
[2]: https://developers.google.com/maps/documentation/javascript/?authuser=1
[3]: https://github.com/owntracks/recorder#configuration-file
