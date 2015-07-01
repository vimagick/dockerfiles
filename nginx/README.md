nginx
=====

`Nginx` is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and
IMAP protocols, as well as a load balancer, HTTP cache, and a web server
(origin server).

## docker-compose.yml

```
nginx:
  image: vimagick/nginx
  ports:
    - "80:80"
  volumes:
    - nginx/nginx.conf:/etc/nginx/nginx.conf
    - html:/usr/share/nginx/html
  restart: always
```
