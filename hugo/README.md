hugo
====

![](https://badge.imagelayers.io/vimagick/hugo:latest.svg)

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
  image: vimagick/hugo
  command: >
    server --bind=0.0.0.0
           --port=80
           --baseUrl=http://blog.easypi.info/
           --theme=hyde
           --watch
  ports:
    - "80:80"
  volumes:
    - ./www:/www
  restart: always
```

> **WARNING:** `hugo server` is for testing purpose.
> The default value of `--baseUrl` option is `http://<bind>:<port>/`.
> I set it to the same value as that in `config.toml` here.
> It maybe not a good practice.

## Up and Running

```
$ alias hugo='docker run --rm -v `pwd`:/www vimagick/hugo'

$ cd ~/fig/hugo/www
$ curl -L https://github.com/spf13/hyde/archive/master.tar.gz | tar xz --strip 1 -C ./themes/hyde/

$ hugo new site .
$ vim config.toml

$ hugo new post/hello-world.md
$ vim content/post/hello-world.md

$ docker-compose up -d

$ hugo
```

> The last `hugo` command will use `baseurl` in `config.toml`.

Open <http://blog.easypi.info/> in your browser!

[1]: http://gohugo.io/
