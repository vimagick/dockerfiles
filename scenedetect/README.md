scenedetect
===========

[PySceneDetect][1] is a tool for detecting shot changes in videos
([example][2]), and can automatically split the video into separate clips.

## Tutorial

```bash
# Create an alias
$ alias scenedetect='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data -w /data vimagick/scenedetect'

# Download sample video
$ wget https://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4

# Perform video splitting
$ scenedetect -i BigBuckBunny_320x180.mp4 split-video
```

[1]: https://github.com/Breakthrough/PySceneDetect
[2]: https://www.scenedetect.com/cli/
