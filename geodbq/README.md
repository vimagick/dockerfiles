geodbq
======

[geodbq][1] is a lightweight command-line tool to inspect and query geoip.dat and geosite.dat files used by Xray-core.

```bash
$ alias geodbq="docker run --rm easypi/geodbq"
$ geodbq ip 8.8.8.8
$ geodbq domain youtube.com
$ geodbq list-rules youtube
```

[1]: https://github.com/Wanwire/Geodbq