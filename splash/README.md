splash
======

[Splash][1] is a javascript rendering service with an HTTP API. It's a
lightweight browser with an HTTP API, implemented in Python using Twisted and
QT.

It's fast, lightweight and state-less which makes it easy to distribute.

## docker-compose.yml

```yaml
version: '2'
services:
  splash:
    image: scrapinghub/splash:3.3.1
    command: --maxrss 2048 --max-timeout 300 --disable-lua-sandbox
    volumes:
      - ./data/filters:/etc/splash/filters
      - ./data/js-profiles:/etc/splash/js-profiles
      - ./data/lua_modules:/etc/splash/lua_modules
      - ./data/proxy-profiles:/etc/splash/proxy-profiles
    mem_limit: 2560M
    restart: unless-stopped
  haproxy:
    image: haproxy:alpine
    ports:
      - "8050:8050"
    volumes:
      - ./data/haproxy:/usr/local/etc/haproxy
    depends_on:
      - splash
    restart: unless-stopped
```

## server

File: data/filters/default.txt

```
||fonts.googleapis.com^
||ajax.googleapis.com^
```

File: data/haproxy/haproxy.cfg

```ini
global
        maxconn 4000

defaults
        timeout connect 5000ms
        timeout client 50000ms
        timeout server 50000ms

frontend front
        bind *:8050
        mode http
        default_backend back

backend back
        mode http
        balance roundrobin
        server a splash_splash_1:8050
        server b splash_splash_2:8050
        server c splash_splash_3:8050
```

```bash
$ cd ~/fig/splash
$ tree
.
├── docker-compose.yml
└── data
    ├── filters
    │   ├── easylist.txt
    │   └── default.txt
    ├── haproxy
    │   └── haproxy.cfg
    ├── js-profiles
    ├── lua_modules
    │   └── utils.lua
    └── proxy-profiles
$ docker-compose up -d --scale splash=3
$ docker-compose ps
      Name                    Command               State           Ports
----------------------------------------------------------------------------------
splash_haproxy_1   /docker-entrypoint.sh hapr ...   Up      0.0.0.0:8050->8050/tcp
splash_splash_1    python3 /app/bin/splash -- ...   Up      8050/tcp
splash_splash_2    python3 /app/bin/splash -- ...   Up      8050/tcp
splash_splash_3    python3 /app/bin/splash -- ...   Up      8050/tcp
```

> If `default.txt` file is present in `--filters-path` folder it is used by default
> when filters argument is not specified. Pass `filters=none` if you don’t want
> default filters to be applied.

## client

```lua
-- http-proxy.lua

function main(splash, args)
  splash:on_request(function(request)
    request:set_proxy{
        host = "61.91.251.235",
        port = 8080,
    }
  end)
  assert(splash:go("http://ifconfig.co"))
  assert(splash:wait(0.5))
  return splash:png()
end
```

```lua
-- baidu-search.lua

function main(splash)
  splash:go('https://www.baidu.com/')
  splash:wait(1)
  splash:select('#kw'):send_text('google')
  splash:wait(1)
  splash:select('#su'):click()
  splash:wait(1)
  splash:evaljs([[
    $('#content_left').css('padding', '0');
  ]])
  splash:set_viewport_full()
  splash:wait(1)
  return splash:select('#content_left'):png()
end
```

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

View more [examples][2].

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
[2]: https://github.com/scrapinghub/splash/tree/master/splash/examples
