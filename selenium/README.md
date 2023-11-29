selenium
========

[Selenium][1] is an umbrella project for a range of tools and libraries that enable
and support the automation of web browsers.

Watch [this][2] video to get started.

## Server

```bash
$ docker-compose up -d
$ curl http://127.0.0.1:4444/
```

> Another way to start selenium server:

```bash
$ npm install -g selenium-standalone
$ selenium-standalone install
$ selenium-standalone start
```

> To kill long-lived sessions:

```bash
ENDPOINT=127.0.0.1:4444
MAX_AGE=$((3*60)) # 3 minutes

curl -s "http://${ENDPOINT}/status" |
  jq -r --arg age ${MAX_AGE} '.value.nodes[].slots[]|select(.session and (.session.start|sub("\\..*Z";"Z")|fromdateiso8601 < now-($age|tonumber))).session.sessionId' |
    xargs -r -t -I {} curl -w '\n' -X DELETE "http://${ENDPOINT}/session/{}"
```

## Client

baidu-search.py

```python
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.common.proxy import Proxy, ProxyType
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

proxy = Proxy({
    'proxyType': 'MANUAL',
    'httpProxy': '1.2.3.4:8080',
    'sslProxy': '1.2.3.4:8080',
})

capabilities = DesiredCapabilities.CHROME
proxy.add_to_capabilities(capabilities)

driver = webdriver.Remote(
    command_executor='http://127.0.0.1:4444/wd/hub',
    desired_capabilities=capabilities
)

driver.get('http://www.baidu.com/')
driver.find_element_by_id('kw').send_keys('ip')
driver.find_element_by_id('su').click()

WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.CLASS_NAME, 'nums_text'))
)

driver.save_screenshot('baidu.png')
driver.close()
```

search-baidu.js

```javascript
var webdriver = require('selenium-webdriver'),
    By = require('selenium-webdriver').By,
    until = require('selenium-webdriver').until,
    fs = require('fs');

webdriver.WebDriver.prototype.saveScreenshot = function(filename) {
    return driver.takeScreenshot().then(function(data) {
        fs.writeFile(filename, data.replace(/^data:image\/png;base64,/,''), 'base64', function(err) {
            if(err) throw err;
        });
    })
};

var driver = new webdriver.Builder()
    .forBrowser('firefox')
    .usingServer('http://127.0.0.1:4444/wd/hub')
    .build();

driver.get('http://www.baidu.com/');
driver.findElement(By.id('kw')).sendKeys('webdriver');
driver.findElement(By.id('su')).click();
driver.wait(until.titleIs('webdriver_百度搜索'), 1000);
driver.saveScreenshot('baidu.png');
driver.quit();
```

```bash
# VNC
$ open vnc://127.0.0.1:5900
$ open http://127.0.0.1:7900

# PYTHON
$ pip3 install selenium
$ python3 baidu-search.py

# NODEJS
$ npm install -g selenium-webdriver
$ node search-baidu.js
```

[1]: http://seleniumhq.org/
[2]: https://www.youtube.com/watch?v=S4OkrnFb-YY
