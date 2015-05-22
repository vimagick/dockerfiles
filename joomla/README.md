`Joomla` is an award-winning content management system (CMS),
which enables you to build Web sites and powerful online applications.

This docker image support mysqli/postgres.

```
# run container
$ docker run -d --restart always --name joomla -p 8000:80 vimagick/joomla

# setup website
$ firefox http://localhost:8000/install
$ firefox http://localhost:8000/installation/index.php
```
