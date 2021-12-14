registry-cli
============

[registry-cli][1] is a script for easy manipulation of docker-registry from command line (and from scripts)

```
$ alias registry-cli='docker run --rm --net host vimagick/registry-cli -r http://127.0.0.1:5000 -l user:pass'
$ registry-cli -i image_name --delete-by-hours $((24*30)) --dry-run
```

[1]: https://github.com/andrey-pohilko/registry-cli
