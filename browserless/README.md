browserless
===========

[Browserless][1] makes it easy to run your puppeteer scripts in an optimized
way. It takes care of all the binaries and managing of Chrome so you don't have
to.

## docker-compose.yml

```yaml
version: '3.8'
services:
  browserless:
    image: browserless/chrome:1-chrome-stable
    ports:
      - "3000:3000"
    environment:
      - DEBUG=browserless/chrome
      - MAX_CONCURRENT_SESSIONS=100
      - CONNECTION_TIMEOUT=300000
      - MAX_QUEUE_LENGTH=100
      - ENABLE_CORS=true
      - ENABLE_DEBUG_VIEWER=true
      - EXIT_ON_HEALTH_FAILURE=true
      # TOKEN=4e2a9c32-2854-479a-a9f3-ba8899f2fdc1
    restart: unless-stopped
```

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

$ npm install puppeteer-core
$ node screenshot.js
$ imgcat google.png

$ pip install selenium
$ python screenshot.py
$ imgcat google.png

$ http http://127.0.0.1:3000/screenshot \
       url=https://www.youtube.com \
       options[fullPage]:=true \
       gotoOptions[waitUntil]=networkidle2 > youtube.png
$ imgcat youtube.png
```

[1]: https://docs.browserless.io/
