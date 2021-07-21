editly
======

[Editly][1] is a tool and framework for declarative NLE (non-linear video editing)
using Node.js and ffmpeg. Editly allows you to easily and programmatically
create a video from a set of clips, images, audio and titles, with smooth
transitions and music overlaid.

## Tutorial

```bash
# Create an alias
$ alias editly='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data vimagick/editly'

# Make config file
$ cat slideshow.json5

# Do video transcoding
$ editly --fast slideshow.json5
```

[1]: https://github.com/mifi/editly
