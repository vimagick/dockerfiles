rembg
=====

[Rembg][1] is a tool to remove images background.

## Web Service

```bash
$ docker compose up -d
$ url=https://raw.githubusercontent.com/danielgatis/rembg/master/examples/girl-3.jpg
$ curl -sSL $url -o input.jpg
$ curl -s -G http://localhost:7000/api/remove -d url=$url -o output.png
$ curl -s http://localhost:7000/api/remove -F file=@input.jpg -o output.png
```

## Ad Hoc Commands

```bash
# Create an alias
$ alias rembg='docker run --rm -u $(id -u):$(id -g) -v $PWD:/rembg danielgatis/rembg:2'

# Remove the background from a local file
$ rembg i input.png output.png

# Remove the background returning only the mask
$ rembg i -om input.png output.png

# Remove the background applying an alpha matting
$ rembg i -a input.png output.png
```

[1]: https://github.com/danielgatis/rembg
