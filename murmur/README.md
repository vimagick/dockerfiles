murmur
======

[Mumble][1] is an open source, low-latency, high quality voice chat software
primarily intended for use while gaming.

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
- IOS: <http://itunes.apple.com/us/app/mumble/id443472808?ls=1&mt=8>
- Windows: <https://github.com/mumble-voip/mumble/releases/download/1.2.17/mumble-1.2.17.msi>
- MacOSX: <https://github.com/mumble-voip/mumble/releases/download/1.2.17/Mumble-1.2.17.dmg>

[1]: https://wiki.mumble.info/wiki/Main_Page
