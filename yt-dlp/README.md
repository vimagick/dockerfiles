yt-dlp
======

[yt-dlp][1] is a small command-line program to download videos from
<https://www.youtube.com/> and a few more sites.

## Tutorial

```bash
# create an alias
$ alias yt='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data vimagick/yt-dlp'

# list all formats
$ yt -F nVjsGKrE6E8

# download it
$ yt -f 18 -o video.mp4 nVjsGKrE6E8

# play it
$ vlc video.mp4
```

[1]: https://github.com/yt-dlp/yt-dlp
