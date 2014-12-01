docker-scrapyd
==============

Dockerfile for building an image that runs [scrapyd][1].  
Then monitor it with [supervisor][2].

## Building

    $ docker build -t scrapyd .

## Running

    $ docker run -p 6800:6800 -p 9001:9001 scrapyd

[1]: https://github.com/scrapy/scrapyd
[2]: http://admin:admin@localhost:9001

