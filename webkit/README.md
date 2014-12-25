WebKit/PhantomJS
================

> A simple web-service based on PhantomJS for rendering javascript-enabled website.

## server

    docker run -d --restart=always -p 1024:1024 -p 2812:2812 -p 9001:9001 --name=webkit vimagick/webkit

## client

    http :1024 targetUrl=https://github.com/
    http :1024 targetUrl=https://github.com/ loadImages:=true requestType=png

## admin

    # monit
    firefox http://localhost:2812/
    # supervisor
    firefox http://localhost:9001/
    # haproxy
    firefox http://localhost:1024/haproxy?stats

## issues

- setup nginx to serving out images files

