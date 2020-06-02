dejavu
======

[dejavu][1] is the Missing Web UI for Elasticsearch: Import, browse and edit
data with rich filters and query views, create search UIs visually.

## docker-compose.yml

```yaml
dejavu:
  image: appbaseio/dejavu
  ports:
    - "1358:1358"
  restart: unless-stopped
```

## elasticsearch.yml

```yaml
http.cors.enabled: true
http.cors.allow-origin: "*"
http.cors.allow-headers : X-Requested-With,X-Auth-Token,Content-Type,Content-Length,Authorization
http.cors.allow-credentials: true
```

### chrome settings

- chrome://settings/content/insecureContent

[1]: https://github.com/appbaseio/dejavu
