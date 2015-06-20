scrapyd
=======

Dockerfile for building an image that runs [scrapy][1] and [scrapyd][2].  

Only two latest python packages are installed:

- `scrapy`: git+https://github.com/scrapy/scrapy.git
- `scrapyd`: git+https://github.com/scrapy/scrapyd.git

Please use this image as base for your own project.

## run as background-daemon for scrapyd

```
$ docker run -d --restart always --name scrapyd -p 6800:6800 vimagick/scrapyd
$ firefox http://localhost:6800
```

## run as interactive-shell for scrapy

```
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

$ docker run --rm --name scrapy -v `pwd`:/code -w /code vimagick/scrapyd bash
>>> scrapy runspider stackoverflow_spider.py -o top-stackoverflow-questions.json
>>> cat top-stackoverflow-questions.json
>>> exit
```

[1]: https://github.com/scrapy/scrapy
[2]: https://github.com/scrapy/scrapyd
