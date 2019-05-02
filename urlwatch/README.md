urlwatch
========

[urlwatch][1] is a tool for monitoring webpages for updates.

## docker-compose.yml

```yaml
urlwatch:
  image: vimagick/urlwatch
  volumes:
    - ./data:/root/.urlwatch
  restart: always
```

[1]: https://thp.io/2008/urlwatch/
