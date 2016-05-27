facedetect
==========

[facedetect][1] is a simple face detector for batch processing. It answers the
basic question: “Is there a face in this image?” and gives back either an exit
code or the coordinates of each detected face in the standard output.

Quick Start
-----------

```
$ alias facedetect='2>/dev/null docker run --rm -v `pwd`:/work -w /work vimagick/facedetect'
$ facedetect image.png
```

[1]: http://www.thregr.org/~wavexx/software/facedetect/
