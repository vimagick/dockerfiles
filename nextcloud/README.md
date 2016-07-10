nextcloud
=========

[Nextcloud][1] puts your data at your fingertips, under your control.

## docker-compose.yml

```yaml
nextcloud:
  image: vimagick/nextcloud
  ports:
    - "8080:80"
  volumes:
    - ./data:/var/www/html/data
  restart: always
```

## Server Setup

```bash
$ mkdir data
$ chown www-data:www-data data
$ docker-compose up -d
```

## Client Setup

- Android: <https://download.nextcloud.com/android/nextcloud-10010099.apk>
- Linux: <https://software.opensuse.org/download/package?project=isv:ownCloud:desktop&package=owncloud-client>
- MacOSX: <https://download.owncloud.com/desktop/stable/ownCloud-2.2.2.3472.pkg>
- Windows: <https://download.owncloud.com/desktop/stable/ownCloud-2.2.2.6192-setup.exe>

[1]: https://nextcloud.com/
