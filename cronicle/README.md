cronicle
========

[Cronicle][1] is a multi-server task scheduler and runner, with a web based
front-end UI.

It handles both scheduled, repeating and on-demand jobs, targeting any number
of slave servers, with real-time stats and live log viewer.

Written in Node.js, proudly open source and MIT licensed.

```bash
$ mkdir -p data/{conf,data,logs}
$ wget -P data https://github.com/jhuckaby/Cronicle/raw/master/sample_conf/config.json
$ wget -P data https://github.com/jhuckaby/Cronicle/raw/master/sample_conf/setup.json
$ docker-compose run --rm cronicle setup
$ docker-compose up -d
$ curl http://127.0.0.1:3012
```

[1]: http://cronicle.net/
