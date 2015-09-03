snort
=====

![](https://badge.imagelayers.io/vimagick/snort:latest.svg)

[`Snort`][1] is an open source intrusion prevention system capable of real-time
traffic analysis and packet logging.

## Quick Start

```
$ alias snort='docker run --rm --net host -v `pwd`:/work -w /work vimagick/snort'
$ snort -vde
```

[1]: https://snort.org/
