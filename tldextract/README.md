tldextract
==========

[tldextract][1] accurately separates a URL's subdomain, domain, and public
suffix, using the Public Suffix List (PSL).

## Server

```bash
docker compose up -d
```

## Client

```bash
# GET single
curl 'http://localhost:8000/extract?input=www.google.com'

# GET mutiple
curl 'http://localhost:8000/extract?input=www.google.com&input=g.cn'

# GET mutiple
curl -G 'http://localhost:8000/extract' \
  --data-urlencode 'input=www.google.com' \
  --data-urlencode 'input=g.cn'

# POST single
curl -X POST 'http://localhost:8000/extract' \
  --json '{"input": "www.google.com"}'

# POST mutiple
curl -X POST 'http://localhost:8000/extract' \
  --json '{"input": ["www.google.com", "g.cn"], "include_private": true}'
```

[1]: https://github.com/john-kurkowski/tldextract
