murmur
======

## docker-compose.yml

```yaml
murmur:
  image: vimagick/murmur
  ports:
    - "64738:64738/tcp"
    - "64738:64738/udp"
  restart: always
```

## Server Setup

```bash
$ docker-compose up -d
$ docker-compose logs
```

> Superuser password was generated at startup.

## Client Setup

- Android: <https://play.google.com/store/apps/details?id=com.morlunk.mumbleclient.free>
- IOS:
- Windows:
- MacOSX:
