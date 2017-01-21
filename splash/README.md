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
  command: --maxrss 4096 --max-timeout 300
  ports:
    - "8050:8050"
    - "8051:8051"
    - "5023:5023"
  volumes:
    - ./data/filters:/etc/splash/filters
    - ./data/js-profiles:/etc/splash/js-profiles
    - ./data/lua_modules:/etc/splash/lua_modules
    - ./data/proxy-profiles:/etc/splash/proxy-profiles
  mem_limit: 4608M
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

```lua
-- crop.lua

function main(splash)
    local url = splash.args.url
    local css1 = splash.args.css1
    local css2 = splash.args.css2
    assert(splash:go(url))
    splash:set_viewport_full()
    local box1 = splash:select(css1):bounds()
    local box2 = splash:select(css2):bounds()
    return splash:png{
        region={
            math.min(box1.left, box2.left),
            math.min(box1.top, box2.top),
            math.max(box1.right, box2.right),
            math.max(box1.bottom, box2.bottom),
        }
    }
end
```

```bash
# whole page
$ http http://server:8050/render.png url==https://www.youtube.com/ > youtube.png

# only logo
$ http http://server:8050/execute lua_source=@youtube-logo.lua > youtube-logo.png

# only form
$ http http://server:8050/execute lua_source=@crop.lua \
                                  url=https://www.facebook.com/ \
                                  css1='#u_0_1' \
                                  css2='#u_0_b' > facebook-form.png
```

[1]: http://splash.readthedocs.org/en/latest/
