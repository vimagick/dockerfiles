browserless
===========

[Browserless][1] makes it easy to run your puppeteer scripts in an optimized
way. It takes care of all the binaries and managing of Chrome so you don't have
to.

## docker-compose.yml

```yaml
browserless:
  image: browserless/chrome:1-chrome-stable
  ports:
    - "3000:3000"
  environment:
    - DEBUG=browserless/chrome
    - MAX_CONCURRENT_SESSIONS=10
    - CONNECTION_TIMEOUT=600000
    - MAX_QUEUE_LENGTH=10
    - ENABLE_CORS=true
    - CHROME_REFRESH_TIME=3600000
  shm_size: 2gb
  restart: always
```

## screenshot.js

```javascript
'use strict';

const puppeteer = require('puppeteer');

(async() => {
  const browser = await puppeteer.connect({browserWSEndpoint: 'ws://localhost:3000'});
  const page = await browser.newPage();
  await page.goto('https://www.google.com/', {waitUntil: 'networkidle2'});
  await page.screenshot({path: 'google.png', fullPage: true});
  await browser.close();
})();
```

## Up and Running

```bash
$ docker-compose up -d
$ PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true npm install puppeteer

$ node screenshot.js
$ imgcat google.png

$ http http://127.0.0.1:3000/screenshot \
       url=https://www.youtube.com \
       options:='{"fullPage":true}' \
       gotoOptions:='{"waitUntil":"networkidle2"}' > youtube.png
$ imgcat youtube.png
```

[1]: https://docs.browserless.io/
