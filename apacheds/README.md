apacheds
========

```yaml
apacheds:
  image: vimagick/apacheds
  ports:
    - "10389:10389"
    - "10636:10636"
  volumes:
    - ./data:/var/lib/apacheds
  restart: unless-stopped
```
