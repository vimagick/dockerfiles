A simple web-service based on PhantomJS for rendering javascript-enabled website.

## server

    docker run -d --restart=always -p 1024:1024 -p 2812:2812 -p 9001:9001 --name=webkit vimagick/webkit

## client

    http :1024 targetUrl=https://github.com/

## admin

    firefox localhost:2812
    firefox localhost:9001
