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
>>> email: admin@datageek.info
>>> domains: datageek.info,bbs.datageek.info,blog.datageek.info,wiki.datageek.info

# copy keys
$ mkdir -p /etc/nginx/ssl/
$ cp ./etc/letsencrypt/live/datageek.info/fullchain.pem /etc/nginx/ssl/datageek.info.crt
$ cp ./etc/letsencrypt/live/datageek.info/privkey.pem /etc/nginx/ssl/datageek.info.key

# reconfig nginx
$ vi /etc/nginx/sites-enabled/default
server {
    listen 80 default;
    server_name _;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name datageek.info blog.datageek.info;
    ssl_certificate ssl/datageek.info.crt;
    ssl_certificate_key ssl/datageek.info.key;
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
