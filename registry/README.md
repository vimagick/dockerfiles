registry
========

[Registry][1] is the Docker toolset to pack, ship, store, and deliver content.

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
  ttl: 168h
^D
>>> exit
$ docker-compose restart
```

> :warning: You cannot use it as registry+mirror at the same time.

## Client Setup

```bash
$ scp registry.easypi.pro:fig/registry/certs/domain.crt \
      /etc/docker/certs.d/registry.easypi.pro:5000/ca.crt

$ vim /etc/docker/daemon.json
{
  "registry-mirrors": [
    "https://registry.easypi.pro:5000"
  ],
  "insecure-registries": [
    "registry.easypi.pro"
  ],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}
                           
$ systemctl reload docker
$ docker info

$ docker pull alpine
$ docker tag alpine registry.easypi.pro:5000/alpine

$ docker login -u username -p password easypi.pro:5000
$ docker push registry.easypi.pro:5000/alpine
$ docker rmi registry.easypi.pro:5000/alpine
$ docker pull registry.easypi.pro:5000/alpine

$ curl -k -u username:password https://registry.easypi.pro:5000/v2/_catalog
$ curl -k -u username:password https://registry.easypi.pro:5000/v2/alpine/tags/list
```

> :warning: Docker will connect [insecure-registries][2] via HTTPS first (ignore TLS error), then try HTTP.

## Cleanup Outdated Images

- https://github.com/vimagick/dockerfiles/tree/master/registry-cli

## Read More

- https://github.com/docker/distribution/blob/master/docs/deploying.md
- https://github.com/docker/distribution/blob/master/docs/insecure.md
- https://serversforhackers.com/tcp-load-balancing-with-nginx-ssl-pass-thru
- https://github.com/docker/distribution/blob/master/docs/recipes/mirror.md
- https://docs.docker.com/registry/spec/api/

[1]: https://github.com/docker/distribution
[2]: https://docs.docker.com/registry/insecure/#deploy-a-plain-http-registry
