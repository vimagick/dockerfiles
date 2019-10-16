nexus3
======

## docker-compose.yml

```yaml
nexus3:
  image: sonatype/nexus3
  ports:
    - "8081:8081"
  volumes:
    - ./data:/nexus-data
  restart: unless-stopped
```

## up and running

```bash
$ mkdir data
$ chown -R 200 data
$ docker-compose up -d
```
