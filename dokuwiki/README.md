dokuwiki
========

![](https://badge.imagelayers.io/vimagick/dokuwiki:latest.svg)

[DokuWiki][1] is a simple to use and highly versatile Open Source wiki software that doesn't require a database. 

## Run

```bash
$ docker run -d -p 8000:80 --restart always --name dokuwiki vimagick/dokuwiki
$ curl http://localhost:8000/install.php
```

## Backup

```bash
$ docker run --rm --volumes-from dokuwiki -v `pwd`:/backup alpine tar czf /backup/dw-backup.tgz /var/www/html
```

## Restore

```bash
$ docker run --rm --volumes-from dokuwiki -v `pwd`:/backup alpine tar xzf /backup/dw-backup.tgz
```

## Plugin

You can install [plugins][2] via **Extension Manager**.

- [backup](https://www.dokuwiki.org/plugin:backup)
- [emoji](https://www.dokuwiki.org/plugin:emoji)
- [wrap](https://www.dokuwiki.org/plugin:wrap)

You can also install them manually.

```bash
$ docker exec -it dokuwiki sh
>>> cd /var/www/html/lib/plugins/
>>> mkdir backup emoji wrap
>>> wget -O- https://github.com/tatewake/dokuwiki-plugin-backup/archive/master.tar.gz | tar xz --strip 1 -C backup
>>> wget -O- https://github.com/ptbrown/dokuwiki-plugin-emoji/archive/master.tar.gz | tar xz --strip 1 -C emoji
>>> wget -O- https://github.com/selfthinker/dokuwiki_plugin_wrap/archive/stable.tar.gz | tar xz --strip 1 -C wrap
>>> chown -R nobody:nobody backup emoji wrap
```

[1]: https://www.dokuwiki.org/dokuwiki
[2]: https://www.dokuwiki.org/plugins
