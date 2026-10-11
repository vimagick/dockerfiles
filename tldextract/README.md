tldextract
==========

[tldextract][1] accurately separates a URL's subdomain, domain, and public
suffix, using the Public Suffix List (PSL).

## Up and Running

```bash
$ docker compose up -d
$ curl "http://localhost:8000/extract?input=https://sub.example.co.uk/path"
$ curl "http://localhost:8000/extract?input=a.blogspot.com&include_private=true"
```

[1]: https://github.com/john-kurkowski/tldextract
