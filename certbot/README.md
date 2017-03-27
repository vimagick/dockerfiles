certbot
=======

[Let’s Encrypt][1] is a new Certificate Authority:
It’s free, automated, and open.

## docker-compose.yml

```
certbot:
  image: quay.io/letsencrypt/letsencrypt
  command: certonly --standalone
  ports:
    - "80:80"
    - "443:443"
  volumes:
    - /etc/letsencrypt:/etc/letsencrypt
    - /var/lib/letsencrypt:/var/lib/letsencrypt
```

## up and running

```
# stop nginx (release 80/tcp and 443/tcp)
$ systemctl stop nginx

# generate keys (interactive)
$ docker-compose run --rm --service-ports certbot
>>> email: admin@easypi.info
>>> domains: easypi.info,blog.easypi.info,wiki.easypi.info

# renew keys (headless)
$ crontab -l
0 0 * * * cd ~/fig/certbot && docker-compose run --rm certbot renew >> renew.log

# list keys
$ tree /etc/letsencrypt/live/
/etc/letsencrypt/live/
└── easypi.info
    ├── cert.pem -> ../../archive/easypi.info/cert1.pem
    ├── chain.pem -> ../../archive/easypi.info/chain1.pem
    ├── fullchain.pem -> ../../archive/easypi.info/fullchain1.pem
    └── privkey.pem -> ../../archive/easypi.info/privkey1.pem

# deploy keys
$ mkdir -p /etc/nginx/ssl/
$ cp /etc/letsencrypt/live/easypi.info/fullchain.pem /etc/nginx/ssl/easypi.info.crt
$ cp /etc/letsencrypt/live/easypi.info/privkey.pem /etc/nginx/ssl/easypi.info.key

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

You can also generate keys without docker.

```bash
# install
apt install build-essential dialog libffi-dev libssl-dev python2.7-dev
curl -sSL https://bootstrap.pypa.io/get-pip.py | python2
pip2 install letsencrypt

# generate
letsencrypt certonly --standalone -d easypi.info -d blog.easypi.info -d wiki.easypi.info

# deploy
mkdir -p /etc/nginx/ssl
cp /etc/letsencrypt/live/easypi.info/fullchain.pem /etc/nginx/ssl/easypi.info.crt
cp /etc/letsencrypt/live/easypi.info/privkey.pem /etc/nginx/ssl/easypi.info.key

# renew
letsencrypt renew
```

## references

- <https://letsencrypt.readthedocs.org/en/latest/using.html#running-with-docker>
- <https://docs.docker.com/compose/reference/run/>
- <http://nginx.org/en/docs/http/configuring_https_servers.html>
- <https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04>
- <http://support.ghost.org/setup-ssl-self-hosted-ghost/>

[1]: https://letsencrypt.org/
