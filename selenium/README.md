selenium
========

[Selenium][1] is an umbrella project for a range of tools and libraries that enable
and support the automation of web browsers.

## Server

docker-compose.yml

```
firefox:
  image: selenium/standalone-firefox
  ports:
    - "4444:4444"
  environment:
    - JAVA_OPTS=-Xmx512m
  restart: always
```

```
$ docker-compose up -d
```

> Another way to start selenium server:

```
$ npm install -g selenium-standalone
$ selenium-standalone install
$ selenium-standalone start
```

## Client

baidu-search.py

```
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

```
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

```
# PYTHON
$ pip3 install selenium
$ python3 baidu-search.py

# NODEJS
$ npm install -g selenium-webdriver
$ node search-baidu.js
```

[1]: http://seleniumhq.org/
