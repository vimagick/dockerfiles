splash
======

[`Splash`][1] is a javascript rendering service with an HTTP API. It's a
lightweight browser with an HTTP API, implemented in Python using Twisted and
QT.

It's fast, lightweight and state-less which makes it easy to distribute.

## docker-compose.yml

```
splash:
  image: scrapinghub/splash
  command: --maxrss 4096
  ports:
    - "8050:8050"
    - "8051:8051"
    - "5023:5023"
  volumes:
    - ./splash/proxy-profiles:/etc/splash/proxy-profiles
    - ./splash/js-profiles:/etc/splash/js-profiles
    - ./splash/filters:/etc/splash/filters
  mem_limit: 4500M
  restart: always
```

## server

```
$ cd ~/fig/splash

$ tree
.
├── docker-compose.yml
└── splash
    ├── filters
    │   ├── easylist.txt
    │   └── default.txt
    ├── js-profiles
    └── proxy-profiles

$ cat splash/filters/default.txt
||fonts.googleapis.com^
||ajax.googleapis.com^

$ docker-compose up -d
```

> If `default.txt` file is present in `--filters-path` folder it is used by default
> when filters argument is not specified. Pass `filters=none` if you don’t want
> default filters to be applied.

## client

```
$ http --proxy http:http://server:8051 http://stackoverflow.com x-splash-render:json x-splash-html:1 x-splash-png:1 x-splash-iframes:1 x-splash-har:1 > so.json
$ jq .har so.json | pbcopy
$ open http://www.softwareishard.com/har/viewer/

$ http --proxy http:http://server:8051 http://stackoverflow.com x-splash-render:png > so.png
$ open so.png
```

[1]: http://splash.readthedocs.org/en/latest/
