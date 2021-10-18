imaginary
=========

[Imaginary][1] is a fast HTTP microservice written in Go for high-level image
processing backed by bimg and libvips.

## up and running

```bash
$ docker-compose up -d
$ http -d -o cat.png :9000/flop url==https://github.githubassets.com/images/modules/logos_page/Octocat.png
```

[1]: https://github.com/h2non/imaginary
