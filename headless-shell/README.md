headless-shell
==============

The [headless-shell][1] project provides a multi-arch container image,
docker.io/chromedp/headless-shell, containing Chrome's headless-shell -- a
slimmed down version of Chrome that is useful for driving, profiling, or
testing web pages.

```bash
$ docker compose up -d

$ curl 127.0.0.1:9222/json/version
{
   "Browser": "Chrome/131.0.6778.205",
   "Protocol-Version": "1.3",
   "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.6778.205 Safari/537.36",
   "V8-Version": "13.1.201.19",
   "WebKit-Version": "537.36 (@81b36b9535e3e3b610a52df3da48cd81362ec860)",
   "webSocketDebuggerUrl": "ws://172.16.1.48:9222/devtools/browser/6a8e5f93-9958-4fe6-8455-9a32e30d3bfe"
}
```

> Read more about [devtools-protocol][2].

[1]: https://github.com/chromedp/docker-headless-shell
[2]: https://chromedevtools.github.io/devtools-protocol/
