browserless
===========

[Browserless][1] makes it easy to run your puppeteer scripts in an optimized
way. It takes care of all the binaries and managing of Chrome so you don't have
to.

## screenshot.js

```javascript
'use strict';

const puppeteer = require('puppeteer-core');

(async() => {
  const browser = await puppeteer.connect({browserWSEndpoint: 'ws://localhost:3000'});
  const page = await browser.newPage();
  await page.setViewport({width: 1280, height: 720});
  await page.goto('https://www.google.com/', {waitUntil: 'networkidle2'});
  await page.waitForSelector('img[alt="Google"]');
  await page.screenshot({path: 'google.png', fullPage: true});
  await browser.close();
})();
```

## screenshot.py

```python
#!/usr/bin/env python

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

options = webdriver.ChromeOptions()
options.add_argument("--window-size=1024,768")
options.add_argument('--headless')
options.add_argument('--no-sandbox')

driver = webdriver.Remote(
    command_executor='http://localhost:3000/webdriver',
    options=options
)

driver.get('https://www.google.com/')

WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.CSS_SELECTOR, 'img[alt="Google"]'))
)

driver.save_screenshot('google.png')
driver.close()
driver.quit()
```

## Up and Running

```bash
$ docker-compose up -d

$ crontab -l
0 */4 * * * docker restart browserless-browserless-1
5 *   * * * docker exec browserless-browserless-1 find /tmp -name '.com.google.Chrome.*' -mmin +60 -exec rm -rf {} \;

$ npm install puppeteer-core
$ node screenshot.js
$ imgcat google.png

$ pip install selenium
$ python screenshot.py
$ imgcat google.png

$ http :3000/screenshot \
       url=https://www.youtube.com \
       options[fullPage]:=true \
       gotoOptions[waitUntil]=networkidle2 > youtube.png
$ imgcat youtube.png

$ http :3000/scrape url=https://www.youtube.com elements[0][selector]=title debug[network]:=true |
    jq -r '.debug.network.outbound[].url' |
      xargs -r tldextract -j |
        jq -r 'select(.fqdn|length>0).fqdn' |
          sort -u
accounts.google.com
fonts.googleapis.com
fonts.gstatic.com
googleads.g.doubleclick.net
i.ytimg.com
www.youtube.com
```

## Waiting for Condition (v2)

[async][2] functions are supported

```bash
$ cat fn.js
async () => {
  await new Promise(resolve => {
    const interval = setInterval(() => {
      var e = document.querySelector('#tryit-data');
      if (e && e.innerText.includes('country')) {
        resolve();
        clearInterval(interval);
      }
    }, 1000)
  });
}

$ http '127.0.0.1:3000/content?token=1234567890&stealth&--proxy-server=http://x.x.x.x:8080' url='https://ipinfo.io' waitForFunction[fn]=@fn.js waitForFunction[timeout]:=10000 > ipinfo.html
```

[1]: https://docs.browserless.io/
[2]: https://docs.browserless.io/HTTP-APIs/content#waitforfunction
