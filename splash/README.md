splash
======

[Splash][1] is a javascript rendering service with an HTTP API. It's a
lightweight browser with an HTTP API, implemented in Python using Twisted and
QT.

It's fast, lightweight and state-less which makes it easy to distribute.

## docker-compose.yml

```yaml
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
└── data
    ├── filters
    │   ├── easylist.txt
    │   └── default.txt
    ├── js-profiles
    └── proxy-profiles

$ cat data/filters/default.txt
||fonts.googleapis.com^
||ajax.googleapis.com^

$ docker-compose up -d
```

> If `default.txt` file is present in `--filters-path` folder it is used by default
> when filters argument is not specified. Pass `filters=none` if you don’t want
> default filters to be applied.

## client

```lua
-- youtube-logo.lua

function main(splash)
    splash:go('https://www.youtube.com/')
    splash:wait(0.5)
    local logo = splash:select('.logo')
    return logo:png()
end
```

```bash
# whole page
$ http http://server:8050/render.png url==https://www.youtube.com > youtube.png

# only logo
$ http http://server:8050/execute lua_source=@youtube-logo.lua > youtube-logo.png
```

[1]: http://splash.readthedocs.org/en/latest/
