opencart
========

[OpenCart][1] is designed feature rich, easy to use, search engine
friendly and with a visually appealing interface.

```
opencart:
  image: vimagick/opencart
  ports:
    - "8000:80"
  links:
    - mysql
  restart: always

mysql:
  image: mysql
  environment:
    - MYSQL_ROOT_PASSWORD=root
    - MYSQL_DATABASE=opencart
  restart: always
```

[1]: http://www.opencart.com/index.php
