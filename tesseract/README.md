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

```bash
$ alias tesseract='docker run --rm -u $(id -u):$(id -g) -v `pwd`:/data -w /data vimagick/tesseract'

$ tesseract input.png output -l eng --psm 3
$ cat output.txt
The (quick) [brown] {fox} jumps!

$ tesseract chinese.jpg stdout -l chi_tra --psm 8 --oem 0
學習
```

[1]: https://github.com/tesseract-ocr/tesseract
