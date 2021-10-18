imaginary
=========

[Imaginary][1] is a fast HTTP microservice written in Go for high-level image
processing backed by bimg and libvips.

## up and running

```bash
$ docker-compose up -d
$ http :9000/health
$ http --form -d -o image.jpg :9000/flop url==https://fly.io/public/images/image-service.jpg
$ http --form -d -o output.jpg :9000/watermark textwidth==100 text==copyright font=='sans 12' opacity==0.5 color==255,200,50 file@image.jpg
```

[1]: https://github.com/h2non/imaginary
