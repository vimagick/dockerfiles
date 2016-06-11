webgoat
=======

![](https://badge.imagelayers.io/vimagick/webgoat:latest.svg)

[WebGoat][1] is a deliberately insecure Web Application.

### docker-compose.yml

```yaml
webgoat:
  image: vimagick/webgoat
  ports:
    - "8080:8080"
  restart: always
```

### up and running

```bash
docker-compose up -d
firefox http://localhost:8080/WebGoat/
```

[1]: https://github.com/WebGoat/WebGoat
