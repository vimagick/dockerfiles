OpenRefine
==========

![](https://badge.imagelayers.io/vimagick/openrefine:latest.svg)

[OpenRefine][1] (formerly Google Refine) is a powerful tool for working with messy
data: cleaning it; transforming it from one format into another; and extending
it with web services and external data.

### docker-compose.yml

```yaml
openrefine:
  image: vimagick/openrefine
  ports:
    - "3333:3333"
  volumes:
    - ./data:/root/.local/share/openrefine
  restart: always
```

[1]: http://openrefine.org/index.html
