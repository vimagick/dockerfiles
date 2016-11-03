nextcloud
=========

[Nextcloud][1] puts your data at your fingertips, under your control.

## docker-compose.yml

```yaml
nextcloud:
  image: indiehosters/nextcloud
  ports:
    - "127.0.0.1:9000:9000"
  volumes:
    - ./data/apps:/var/www/html/apps
    - ./data/config:/var/www/html/config
    - ./data/data:/var/www/html/data
  restart: always

nginx:
  image: nginx:alpine
  volumes:
    - ./nginx.conf:/etc/nginx/conf.d/default.conf
  volumes_from:
    - nextcloud
  net: host
  restart: always
```

## Server Setup

```bash
$ docker-compose up -d
```

## Client Setup

- Android: <https://download.nextcloud.com/android/>
- MacOSX: <https://download.nextcloud.com/desktop/releases/Mac/Installer/>
- Windows: <https://download.nextcloud.com/desktop/releases/Windows/>

[1]: https://nextcloud.com/
