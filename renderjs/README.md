docker-renderjs
===============

Dockerfile for building an image that runs webkit rendering service.

## Building

    $ docker build -t renderjs .

## Running

    $ docker run -d -p 1024:1024 -p 9001:9001 renderjs

## Playing

    # raw output
    $ http :1024 url=http://datageek.info/

    # json output
    $ http :1024/json/ url=http://datageek.info/

    # supervisor
    $ firefox http://localhost:9001/

    # haproxy
    $ firefox http://localhost:1024/haproxy?stats

