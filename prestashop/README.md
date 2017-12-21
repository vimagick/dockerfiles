prestashop
==========

[PrestaShop][1] has comprehensive product features for small, medium or large
ecommerce stores and sell online. Hundreds of features are standard and 100%
free.

## docker-compose.yml

```yaml
prestashop:
  image: vimagick/prestashop
  ports:
    - "8000:80"
  links:
    - mysql
  volumes:
    - /var/www
  restart: always

mysql:
  image: mysql
  environment:
    - MYSQL_ROOT_PASSWORD=root
    - MYSQL_DATABASE=prestashop
  restart: always
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
        proxy_pass       http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

## Enable SSL

1. Activate SSL directtly on the database, (because the broken images avoid to
   use the activate SSL option on the admin panel, click on the url simply does
   not pass the test). To ativate SSL on the database i use the next query on:

        UPDATE ps_configuration SET value = 1 WHERE name = 'PS_SSL_ENABLED';

2. Add the next line to the `.htacces` file to avoid teh loop redirect issue with
   SSL enabled:

        SetEnv HTTPS On

3. Configure > Shop Parameters > General > Enable SSL on all pages

## Documentation

<http://doc.prestashop.com/dashboard.action>

[1]: https://www.prestashop.com/
