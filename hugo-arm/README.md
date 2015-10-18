hugo-arm
========

![](https://badge.imagelayers.io/vimagick/hugo-arm:latest.svg)

[hugo][1] makes the web fun again.

## Directory Tree

```
~/fig/hugo/
|-- docker-compose.yml
`-- www/
    `-- themes/
        `-- hyde/
```

## docker-compose.yml

```
hugo:
  image: vimagick/hugo-arm
  command: >
    server --bind=0.0.0.0
           --port=80
           --baseUrl=http://blog.datageek.info/
           --theme=hyde
           --watch
  ports:
    - "80:80"
  volumes:
    - ./www:/www
  restart: always
```

## Up and Running

```
$ alias hugo='docker run --rm -v `pwd`:/www vimagick/hugo-arm'
$ cd ~/fig/hugo/www
$ curl -L https://github.com/spf13/hyde/archive/master.tar.gz | tar xz --strip 1 -C ./themes/hyde/
$ hugo new site .
$ vim config.toml
$ hugo new post/hello-world.md
$ vim content/post/hello-world.md
$ cd ~/fig/hugo/
$ docker-compose up -d
```

Open <http://blog.datageek.info/> in your browser!

[1]: http://gohugo.io/
