portainer
=========

[Portainer][1] is an open-source lightweight management UI which allows you to easily manage your Docker host or Swarm cluster.

## docker-compose.yml

```yaml
portainer:
  image: portainer/portainer
  ports:
    - "9000:9000"
  volumes:
    - ./data:/data
    - /var/run/docker.sock:/var/run/docker.sock
  restart: always
```

[1]: http://portainer.io/
