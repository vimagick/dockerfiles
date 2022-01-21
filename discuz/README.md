discuz
======

[Discuz!][1] is an internet forum software written in PHP and developed by a chinese company.

:-1: Discuz! is not a open source software. :skull:

- Initial release: March 2002
- Stable release: X3.2 (September 23, 2013; 2 years ago)
- License: proprietary (costs about ¥3000)

:+1: Try open source softwares: :angel:

- [discourse](https://hub.docker.com/r/discourse/discourse/)
- [nodebb](https://hub.docker.com/r/vimagick/nodebb/)
- [phpbb](https://hub.docker.com/r/vimagick/phpbb/)

## docker-compose.yml

```
discuz:
  image: vimagick/discuz
  ports:
    - "8000:80"
  links:
    - mysql
  restart: always

mysql:
  image: mysql
  environment:
    - MYSQL_ROOT_PASSWORD=root
    - MYSQL_DATABASE=discuz
    - MYSQL_USER=discuz
    - MYSQL_PASSWORD=discuz
  restart: always
```

## /etc/nginx/sites-enabled/discuz

```
server {
    listen 80;
    server_name discuz.easypi.info;
    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

> :warning: You should pass HTTP headers to fix wrong URL.

[1]: http://www.discuz.net
