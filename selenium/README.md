selenium
========

[Selenium][1] is an umbrella project for a range of tools and libraries that enable
and support the automation of web browsers.

Watch [this][2] video to get started.

## Server

docker-compose.yml

```yaml
firefox:
  image: selenium/standalone-firefox-debug
  ports:
    - "4444:4444"
    - "5900:5900"
  environment:
    - JAVA_OPTS=-Xmx512m
  restart: always
```

docker-compose-grid.yml

```yaml
hub:
  image: selenium/hub
  container_name: hub
  ports:
    - "4444:4444"
  environment:
    - GRID_TIMEOUT=60
    - GRID_BROWSER_TIMEOUT=30
  retart: always

chrome:
  image: selenium/node-chrome
  container_name: chrome
  ports:
    - "5555"
  links:
    - hub
  retart: always

firefox:
  image: selenium/node-firefox
  container_name: firefox
  ports:
    - "5555"
  links:
    - hub
  retart: always
```

> Access grid console at <http://127.0.0.1:4444/grid/console>

docker-compose-node.yml

```yaml
firefox:
  image: selenium/node-firefox
  ports:
    - "5555:5555"
    - "5900:5900"
  environment:
    - JAVA_OPTS=-Xmx512m
    - NODE_MAX_INSTANCES=2
    - NODE_MAX_SESSION=2
    - SE_OPTS=-host 5.6.7.8 -port 5555
    - HUB_PORT_4444_TCP_ADDR=1.2.3.4
    - HUB_PORT_4444_TCP_PORT=4444
  restart: always
```

```bash
$ docker-compose up -d
```

> Another way to start selenium server:

```bash
$ npm install -g selenium-standalone
$ selenium-standalone install
$ selenium-standalone start
```

## Client

baidu-search.py

```python
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

driver = webdriver.Remote(
    command_executor='http://127.0.0.1:4444/wd/hub',
    desired_capabilities=DesiredCapabilities.FIREFOX
)

driver.get('http://www.baidu.com/')
driver.find_element_by_id('kw').send_keys('webdriver')
driver.find_element_by_id('su').click()
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
$ open vnc://:secret@127.0.0.1:5900

# PYTHON
$ pip3 install selenium
$ python3 baidu-search.py

# NODEJS
$ npm install -g selenium-webdriver
$ node search-baidu.js
```

[1]: http://seleniumhq.org/
[2]: https://www.youtube.com/watch?v=S4OkrnFb-YY
