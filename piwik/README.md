piwik
=====

[`Piwik`][1] is the leading open alternative to Google Analytics that gives you
full control over your data. Piwik lets you easily collect data from websites,
apps & IoT and visualise this data and extract insights. Privacy is built-in.

## docker-compose.yml

```
piwik:
  image: vimagick/piwik
  ports:
    - "8000:80"
  links:
    - mysql
  restart: always

mysql:
  image: mysql
  environment:
    - MYSQL_ROOT_PASSWORD=root
    - MYSQL_DATABASE=piwik
  restart: always
```

[1]: http://piwik.org/

