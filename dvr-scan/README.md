dvr-scan
========

[DVR-Scan][1] is a cross-platform command-line (CLI) application that
automatically detects motion events in video files.

## Tutorial

```bash
# build a docker image
$ docker build -t vimagick/dvr-scan .

# create an alias
$ alias dvr-scan='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data vimagick/dvr-scan'

# process a video
$ dvr-scan -i video.mp4
```

[1]: https://github.com/Breakthrough/DVR-Scan
