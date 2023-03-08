crawlee
=======

[Crawlee][1] is a web scraping and browser automation library Crawlee is a web
scraping and browser automation library.

```bash
$ docker-compose build
Building crawlee
Successfully built xxxxxxxxxxxx
Successfully tagged crawlee:latest

$ docker-compose run --rm crawlee
INFO  BasicCrawler: Starting the crawl
INFO  BasicCrawler: Processing ...
Crawler finished.

$ tree data
├── datasets
│   └── default
│       ├── 000000001.json
│       ├── 000000002.json
│       ├── 000000003.json
│       └── 000000004.json
├── key_value_stores
└── request_queues
```

[1]: https://crawlee.dev/
