memos
=====

[Memos][1] is a privacy-first, lightweight note-taking service. Easily capture and share your great thoughts.

```bash
$ API_URL=http://127.0.0.1:5230/api/v1
$ API_TOKEN=******
$ curl -H "Content-Type: application/json" -H "Authorization: Bearer $API_TOKEN" $API_URL/memos -d '{"content": "hello world", "visibility": "PUBLIC"}'
```

Read API Doc [here][2].

[1]: https://www.usememos.com/
[2]: https://memos.apidocumentation.com/reference#tag/memoservice/POST/api/v1/memos
