jsonwire-grid
=============

This is high-performance scalable implementation of Selenium Grid (hub).

## up and running

```
# every registed node accepts only one session (`maxInstances` does not work)
$ docker-compose up -d

# there are three common status for every registed node
$ curl http://127.0.0.1:4444/grid/status | jq -r .node_list[].status
available
reserved
busy
```

## quick start

```python
#!/usr/bin/env python

from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

# it does not work
capabilities = DesiredCapabilities.FIREFOX
capabilities = DesiredCapabilities.CHROME

# it works
capabilities = {'browserName': 'firefox', 'version': '70.0'}
capabilities = {'platform': 'ANY', 'browserName': 'chrome', 'version': '78.0.3904.70'}

driver = webdriver.Remote(
    command_executor='http://127.0.0.1:4444/wd/hub',
    desired_capabilities=capabilities
)

driver.get('https://www.google.com/')

driver.save_screenshot('google.png')
driver.quit()
```

https://github.com/qa-dev/jsonwire-grid
