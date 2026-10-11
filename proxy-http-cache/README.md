proxy-http-cache
================

[Proxy HTTP Cache][1] is a Redis-backed response deduplication. point any HTTP client at it
— n8n, Make, Zapier, curl, whatever — and identical upstream requests get served from cache.
Redis is optional; without it, the proxy degrades to pass-through.

```bash
$ docker compose up -d
$ curl "http://localhost:8000/proxy?url=https://ipinfo.io/json"
$ curl http://localhost:8000/health
$ curl http://localhost:8000/cache/stats
$ curl -X DELETE http://localhost:8000/cache
```

[1]: https://github.com/yigitkonur/proxy-http-cache
