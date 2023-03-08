crawlee
=======

[Crawlee][1] is a web scraping and browser automation library Crawlee is a web
scraping and browser automation library.

```bash
$ docker run --rm -it -v $PWD:/tmp apify/actor-node:16 sh
>>> export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
>>> export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1
>>> npx crawlee create -t cheerio-js my-crawler
>>> mv my-crawler /tmp
>>> exit

$ docker-compose build my-crawler

$ docker-compose run --rm my-crawler

$ tree my-crawler/storage/
├── datasets
│   └── default
│       └── 000000001.json
├── key_value_stores
└── request_queues
```

[1]: https://crawlee.dev/
