docker-renderjs
===============

Dockerfile for building an image that runs webkit rendering service.

## Building

    $ docker build -t renderjs .

## Running

    $ docker run -p 1024:1024 -p 9001:9001 renderjs

## Playing

    $ http :1024 url=http://datageek.info/

