mediagoblin
===========

[MediaGoblin][1] is a free software media publishing platform that anyone can
run.  You can think of it as a decentralized alternative to Flickr, YouTube,
SoundCloud, etc.

## docker-compose.yml

```yaml
mediagoblin:
  image: vimagick/mediagoblin
  ports:
    - "8080:80"
  volumes:
    - ./data:/var/lib/mediagoblin
  environment:
    - MG_USER=admin
    - MG_PASS=admin
    - MG_MAIL=admin@easypi.info
  restart: always
```

## up and running

```bash
# start service
$ docker-compose up -d

# open browser
$ firefox http://localhost:8080/
```

[1]: http://mediagoblin.org/
