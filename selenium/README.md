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

## Client

demo.py

```
#!/usr/bin/env python3

from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

driver = webdriver.Remote(
    command_executor='http://127.0.0.1:4444/wd/hub',
    desired_capabilities=DesiredCapabilities.FIREFOX
)

driver.get('https://github.com/SeleniumHQ/docker-selenium')
driver.save_screenshot('before-click.png')
driver.find_element_by_css_selector('.author>a').click()
driver.save_screenshot('after-click.png')
```

```
$ pip3 install selenium
$ python3 demo.py
$ ls *.png
```

[1]: http://seleniumhq.org/
