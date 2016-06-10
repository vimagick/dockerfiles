django-cms
==========

[django CMS][1] is a modern web publishing platform built with Django, the web
application framework “for perfectionists with deadlines”.

### docker-compose.yml

```yaml
django-cms:
  image: vimagick/django-cms
  ports:
    - "8000:80"
  restart: always
```

### up and running

```bash
$ docker-compose up -d

$ docker-compose exec django-cms sh
/app # ./manage.py createsuperuser
Username (leave blank to use 'root'): admin
Email address: admin@easypi.info
Password: ******
Password (again): ******
Superuser created successfully.
/app # exit

$ firefox http://easypi.info:8000
```

[1]: https://www.django-cms.org/en/
