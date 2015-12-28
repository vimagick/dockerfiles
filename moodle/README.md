moodle
======

[Moodle][1] is a learning platform designed to provide educators,
administrators and learners with a single robust, secure and integrated system
to create personalised learning environments.

```
moodle:
  image: vimagick/moodle
  ports:
    - "8000:80"
  links:
    - mysql
  volumes:
    - ./moodledata:/var/moodledata
  restart: always

mysql:
  image: mysql
  environment:
    - MYSQL_ROOT_PASSWORD=root
    - MYSQL_DATABASE=moodle
  restart: always
```

[1]: https://moodle.org/
