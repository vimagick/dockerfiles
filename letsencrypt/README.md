letsencrypt
===========

[Let’s Encrypt][1] is a new Certificate Authority:
It’s free, automated, and open.

## docker-compose.yml

```
letsencrypt:
  image: quay.io/letsencrypt/letsencrypt
  command: auth
  ports:
    - "80:80"
    - "443:443"
  volumes:
    - "./etc/letsencrypt:/etc/letsencrypt"
    - "./var/lib/letsencrypt:/var/lib/letsencrypt"
```

## up and running

```
# stop nginx (release 80/tcp and 443/tcp)
$ systemctl stop nginx

# generate keys
$ docker-compose run --rm --service-ports letsencrypt
>>> email: admin@easypi.info
>>> domains: easypi.info,bbs.easypi.info,blog.easypi.info,wiki.easypi.info

# copy keys
$ mkdir -p /etc/nginx/ssl/
$ cp ./etc/letsencrypt/live/easypi.info/fullchain.pem /etc/nginx/ssl/easypi.info.crt
$ cp ./etc/letsencrypt/live/easypi.info/privkey.pem /etc/nginx/ssl/easypi.info.key

# reconfig nginx
$ vi /etc/nginx/sites-enabled/default
server {
    listen 80 default;
    server_name _;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name easypi.info blog.easypi.info;
    ssl_certificate ssl/easypi.info.crt;
    ssl_certificate_key ssl/easypi.info.key;
    location / {
        proxy_pass http://127.0.0.1:8000;
    }
}

# start nginx
$ systemctl start nginx
```

## references

- https://letsencrypt.readthedocs.org/en/latest/using.html#running-with-docker
- https://docs.docker.com/compose/reference/run/
- http://nginx.org/en/docs/http/configuring_https_servers.html

[1]: https://letsencrypt.org/
