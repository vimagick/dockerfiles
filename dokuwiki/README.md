dokuwiki
========

![](https://badge.imagelayers.io/vimagick/dokuwiki:latest.svg)

[DokuWiki][1] is a simple to use and highly versatile Open Source wiki software that doesn't require a database. 

## Run

```
$ docker run -d -p 8000:80 --restart always --name dokuwiki vimagick/dokuwiki
```

## Backup

```
$ docker run --volumes-from dokuwiki -v `pwd`:/backup alpine tar czf /backup/dw-backup.tgz /var/www/html
```

## Restore

```
$ docker run --volumes-from dokuwiki -v `pwd`:/backup alpine tar xzf /backup/dw-backup.tgz
```

[1]: https://www.dokuwiki.org/dokuwiki
