webdis
======

[Webdis][1] is a simple HTTP server which forwards commands to Redis and sends
the reply back using a format of your choice. Accessing
/COMMAND/arg0/arg1/.../argN[.ext] on Webdis executes the command on Redis and
returns the response; the reply format can be changed with the optional
extension (.json, .txt…)

## docker-compose.yml

```yaml
webdis:
  image: anapsix/webdis
  ports:
    - "7379:7379"
  environment:
    - REDIS_HOST=x.x.x.x
    - REDIS_PORT=6379
    - REDIS_AUTH=null
    - DATABASE=0
    - HTTP_HOST=0.0.0.0
    - HTTP_PORT=7379
  restart: unless-stopped
```

[1]: https://webd.is/
