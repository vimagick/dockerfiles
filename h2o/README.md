h2o
===

![](https://badge.imagelayers.io/vimagick/h2o:latest.svg)

[H2O][1] is a new generation HTTP server providing quicker response to users when
compared to older generation of web servers.

## Quick Start

```
$ mkdir html
$ echo 'hello world' > html/index.html
$ docker run -d -p 8080:80 -v `pwd`/html:/var/www/html vimagick/h2o
$ curl localhost:8080
```

[1]: https://h2o.examp1e.net/index.html
