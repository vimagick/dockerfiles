registry
========

[Registry][1] is the Docker toolset to pack, ship, store, and deliver content.

## docker-compose.yml

```yaml
registry:
  image: registry:2
  ports:
    - "5000:5000"
  volumes:
    - /etc/docker/registry
    - ./data:/var/lib/registry
    - ./certs:/certs
    - ./auth:/auth
  environment:
    - REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt
    - REGISTRY_HTTP_TLS_KEY=/certs/domain.key
    - REGISTRY_AUTH=htpasswd
    - REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm
    - REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd
  restart: always

frontend:
  image: konradkleine/docker-registry-frontend:v2
  ports:
    - "8080:80"
    - "8443:443"
  links:
    - registry
  volume:
    - ./certs/domain.crt:/etc/apache2/domain.crt
    - ./certs/domain.key:/etc/apache2/domain.key
  environment:
    - ENV_DOCKER_REGISTRY_HOST=registry
    - ENV_DOCKER_REGISTRY_PORT=5000
    - ENV_DOCKER_REGISTRY_USE_SSL=1
    - ENV_USE_SSL=yes
  restart: always
```

## Server Setup

```bash
$ mkdir -p ~/fig/registry/{auth,certs}
$ cd ~/fig/registry
$ openssl req -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key -x509 -days 365 -out certs/domain.crt
$ docker-compose up -d
$ docker-compose exec registry sh
>>> htpasswd -Bbn username password >> /auth/htpasswd
>>> cat >> /etc/docker/registry/config.yml
proxy:
  remoteurl: https://registry-1.docker.io
  username: username
  password: password
^D
>>> exit
$ docker-compose restart
```

## Client Setup

```bash
$ scp registry.easypi.info:fig/registry/certs/domain.crt \
      /etc/docker/certs.d/registry.easypi.info:5000/ca.crt

$ systemctl edit docker
# /etc/systemd/system/docker.service.d/override.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// --registry-mirror https://registry.easypi.info:5000
                           
$ systemctl daemon-reload
$ systemctl restart docker

$ docker pull alpine
$ docker tag alpine registry.easypi.info:5000/alpine

$ docker login -u username -p password easypi.info:5000
$ docker push registry.easypi.info:5000/alpine
$ docker rmi registry.easypi.info:5000/alpine
$ docker pull registry.easypi.info:5000/alpine

$ firefox http://registry.easypi.info:8080
```

> Append `--insecure-registry registry.easypi.info:5000` option to disable TLS.

## Read More

- https://github.com/docker/distribution/blob/master/docs/deploying.md
- https://github.com/docker/distribution/blob/master/docs/insecure.md
- https://serversforhackers.com/tcp-load-balancing-with-nginx-ssl-pass-thru
- https://github.com/docker/distribution/blob/master/docs/recipes/mirror.md

[1]: https://github.com/docker/distribution
