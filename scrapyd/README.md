scrapyd
=======

![](http://dockeri.co/image/vimagick/scrapyd)

[scrapy][1] is an open source and collaborative framework for extracting the
data you need from websites. In a fast, simple, yet extensible way.

[scrapyd][2] is a service for running Scrapy spiders.  It allows you to deploy
your Scrapy projects and control their spiders using a HTTP JSON API.

[scrapyd-client][3] is a client for scrapyd. It provides the scrapyd-deploy
utility which allows you to deploy your project to a Scrapyd server.

[scrapy-splash][4] provides Scrapy+JavaScript integration using Splash.

[scrapyrt][5] allows you to easily add HTTP API to your existing Scrapy project.

[pillow][6] is the Python Imaging Library to support the ImagesPipeline.

This image is based on `debian:jessie`, 6 latest python packages are installed:

- `scrapy`: git+https://github.com/scrapy/scrapy.git
- `scrapyd`: git+https://github.com/scrapy/scrapyd.git
- `scrapyd-client`: git+https://github.com/scrapy/scrapyd-client.git
- `scrapy-splash`: git+https://github.com/scrapinghub/scrapy-splash.git
- `scrapyrt`: git+https://github.com/scrapinghub/scrapyrt.git
- `pillow`: git+https://github.com/python-pillow/Pillow.git

Please use this as base image for your own project.

## docker-compose.yml

```yaml
scrapyd:
  image: vimagick/scrapyd
  ports:
    - "6800:6800"
  volumes:
    - ./data:/var/lib/scrapyd
    - /usr/local/lib/python2.7/dist-packages
  restart: always

scrapy:
  image: vimagick/scrapyd
  command: bash
  volumes:
    - .:/code
  working_dir: /code
  restart: always
```

## Run it as background-daemon for scrapyd

```bash
$ docker-compose up -d scrapyd
$ docker-compose logs -f scrapyd
$ docker cp scrapyd_scrapyd_1:/var/lib/scrapyd/items .
$ tree items
└── myproject
    └── myspider
        └── ad6153ee5b0711e68bc70242ac110005.jl
```

```bash
$ mkvirtualenv webbot
$ pip install scrapy scrapyd-client

$ scrapy startproject myproject
$ cd myproject
$ setvirtualenvproject

$ scrapy genspider myspider mydomain.com
$ scrapy edit myspider
$ scrapy list

$ vi scrapy.cfg
$ scrapyd-client deploy
$ curl http://localhost:6800/schedule.json -d project=myproject -d spider=myspider
$ firefox http://localhost:6800
```

File: scrapy.cfg

```ini
[settings]
default = myproject.settings

[deploy]
url = http://localhost:6800/
project = myproject
```

## Run it as interactive-shell for scrapy

```bash
$ cat > stackoverflow_spider.py << _EOF_
import scrapy

class StackOverflowSpider(scrapy.Spider):
    name = 'stackoverflow'
    start_urls = ['http://stackoverflow.com/questions?sort=votes']

    def parse(self, response):
        for href in response.css('.question-summary h3 a::attr(href)'):
            full_url = response.urljoin(href.extract())
            yield scrapy.Request(full_url, callback=self.parse_question)

    def parse_question(self, response):
        yield {
            'title': response.css('h1 a::text').extract()[0],
            'votes': response.css('.question .vote-count-post::text').extract()[0],
            'body': response.css('.question .post-text').extract()[0],
            'tags': response.css('.question .post-tag::text').extract(),
            'link': response.url,
        }
_EOF_

$ docker-compose run --rm scrapy
>>> scrapy runspider stackoverflow_spider.py -o top-stackoverflow-questions.json
>>> cat top-stackoverflow-questions.json
>>> exit
```

[1]: https://github.com/scrapy/scrapy
[2]: https://github.com/scrapy/scrapyd
[3]: https://github.com/scrapy/scrapyd-client
[4]: https://github.com/scrapinghub/scrapy-splash
[5]: https://github.com/scrapinghub/scrapyrt
[6]: https://github.com/python-pillow/Pillow
