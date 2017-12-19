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

## Documentation

<http://doc.prestashop.com/dashboard.action>

[1]: https://www.prestashop.com/
