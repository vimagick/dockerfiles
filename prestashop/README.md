prestashop
==========

[PrestaShop][1] has comprehensive product features for small, medium or large
ecommerce stores and sell online. Hundreds of features are standard and 100%
free.

## docker-compose.yml

```yaml
version: "3.8"

services:

  prestashop:
    image: prestashop/prestashop:1.7-apache
    ports:
      - "8080:80"
    volumes:
      - ./data/prestashop:/var/www/html
    depends_on:
      - mysql
    restart: unless-stopped

  mysql:
    image: mariadb:10
    volumes:
      - ./data/mysql:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=root
      - MYSQL_DATABASE=prestashop
    restart: unless-stopped
```

## Nginx Config

```nginx
server {
    listen               80 default_server;
    server_name          _;
    return               301 https://$host$request_uri;
}

server {
    listen               443 ssl;
    server_name          shop.easypi.pro;
    ssl_certificate      ssl/easypi.pro.crt;
    ssl_certificate_key  ssl/easypi.pro.key;
    ssl_protocols        TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers          HIGH:!aNULL:!MD5;
    client_max_body_size 20M;
    location / {
        proxy_pass       http://127.0.0.1:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

## Enable SSL

0. Open http://localhost:8080 (`ssh -L 8080:localhost:8080`)

1. Configure > Shop Parameters > Traffic & SEO > SEO & URLs > Set shop URL

        - Shop domain: shop.easypi.pro
        - SSL domain: shop.easypi.pro
        - Base URI: /

2. Activate SSL directtly on the database, (because the broken images avoid to
   use the activate SSL option on the admin panel, click on the url simply does
   not pass the test). To ativate SSL on the database i use the next query on:

        UPDATE ps_configuration SET value = 1 WHERE name = 'PS_SSL_ENABLED';

3. Add the next line to the `.htacces` file to avoid the loop redirect issue with
   SSL enabled:

        SetEnv HTTPS On

4. Configure > Shop Parameters > General > Enable SSL on all pages

## Reset Admin Password

```bash
$ docker-compose exec prestashop bash
>>> grep cookie app/config/parameters.php
    'cookie_key' => 'xxxxxx',
>>> exit

$ docker-compose exec mysql mysql -uroot -proot prestashop
>>> select * from ps_employee where email='admin@easypi.pro';
>>> update ps_employee set passwd=md5(concat("xxxxxx", "password")) where email='admin@easypi.pro';
>>> select * from ps_employee where email='admin@easypi.pro';
```

## Documentation

<http://doc.prestashop.com/dashboard.action>

[1]: https://www.prestashop.com/
