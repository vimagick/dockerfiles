tesseract
=========

![](https://badge.imagelayers.io/vimagick/tesseract:latest.svg)

[Tesseract][1] is an Open Source OCR engine, available under the Apache 2.0
license. It can be used directly, or (for programmers) using an API. It
supports a wide variety of languages.

Tesseract doesn't have a built-in GUI, but there are several available from the
3rdParty page.

Quick Start
-----------

```
$ alias tesseract='docker run --rm -v `pwd`:/work -w /work vimagick/tesseract'
$ tesseract myscan.png out
$ cat out.txt
```

[1]: https://github.com/tesseract-ocr/tesseract
