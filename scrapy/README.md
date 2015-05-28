## WHAT-IS

`Scrapy`: An open source and collaborative framework for extracting the data  
you need from websites.  In a fast, simple, yet extensible way.

This image is based on `debian:jessie`, and it only takes 278.6 MB.  
You can create a scrapy (v0.24.6) project on top of this image.

## HOW-TO

```
$ docker run --name scrapy -it vimagick/scrapy
>>> scrapy startproject demo
>>> cd demo
>>> scrapy genspider example example.com
>>> scrapy edit example
>>> scrapy crawl example
```

## TODO-LIST

- [x] build [libxml2][1]/[libxslt][2] from source
- [x] add [scrapy_bash_completion][3] script

[1]: http://www.xmlsoft.org/downloads.html
[2]: http://git.gnome.org/browse/libxslt/
[3]: https://github.com/scrapy/scrapy/raw/master/extras/scrapy_bash_completion
