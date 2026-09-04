webdis
======

[Webdis][1] is a simple HTTP server which forwards commands to Redis and sends
the reply back using a format of your choice. Accessing
/COMMAND/arg0/arg1/.../argN[.ext] on Webdis executes the command on Redis and
returns the response; the reply format can be changed with the optional
extension (.json, .txt…)

## docker-compose.yml

```yaml
services:

  webdis:
    image: easypi/webdis
    ports:
      - "7379:7379"
    volumes:
      - ./data/webdis:/etc/webdis
    depends_on:
      - redis
    restart: unless-stopped

  redis:
    image: redis:8-alpine
    command: --save 900 1
    ports:
      - "127.0.0.1:6379:6379"
    volumes:
      - ./data/redis:/data
    restart: unless-stopped
```

[1]: https://webd.is/
