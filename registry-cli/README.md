registry-cli
============

[registry-cli][1] is a script for easy manipulation of docker-registry from command line (and from scripts)

```
# extract binary (good luck)
$ docker run --rm -v $PWD:/tmp --entrypoint cp vimagick/registry-cli /usr/local/bin/registry-cli /tmp
$ ./registry-cli --help && mv registry-cli /usr/local/bin
[19012] Error loading Python lib '/tmp/_MEI7rjw5j/libpython3.10.so.1.0'

# make an alias
$ alias registry-cli='docker run --rm --net host vimagick/registry-cli -r http://127.0.0.1:5000 -l user:pass'

# list all images
$ registry-cli

# cleanup old images
$ registry-cli -i image_name --delete-by-hours $((24*30)) --dry-run
```

[1]: https://github.com/andrey-pohilko/registry-cli
