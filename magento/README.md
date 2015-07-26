magento
=======

`Magento` Community Edition is open source eCommerce software used to power your
online store and can be downloaded for free. Developers can modify the core
code and add features and functionality by installing extensions from the
Magento Connect marketplace.

```
magento:
  image: vimagick/magento
  ports:
    - "8000:80"
  links:
    - mysql
  restart: always

mysql:
  image: mysql
  environment:
    - MYSQL_ROOT_PASSWORD=root
    - MYSQL_DATABASE=magento
  restart: always
```
