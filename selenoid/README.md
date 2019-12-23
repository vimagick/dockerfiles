selenoid
========

[Selenoid][1] is a Golang implementation of Selenium protocol using Docker to launch
browser sessions (so it is a replacement of Java-based Selenium server).
Currently it supports working with Docker directly (no support for Swarm or
Kubernetes).


Directory Tree
--------------

```
selenoid/
├── README.md
├── data/
│   ├── config/
│   │   └── browsers.json
│   ├── logs/
│   └── video/
└── docker-compose.yml
```

Required Images
---------------

- aerokube/selenoid:latest-release
- aerokube/selenoid-ui:latest-release
- selenoid/video-recorder:latest-release
- selenoid/chrome:79.0
- selenoid/firefox:71.0
- selenoid/vnc:chrome_79.0
- selenoid/vnc:firefox_71.0

```json
{
  "chrome": {
    "default": "79.0",
    "versions": {
      "79.0": {
        "image": "selenoid/vnc:chrome_79.0",
        "port": "4444"
      }
    }
  },
  "firefox": {
    "default": "71.0",
    "versions": {
      "71.0": {
        "image": "selenoid/vnc:firefox_71.0",
        "port": "4444"
      }
    }
  }
}
```

```python
#!/usr/bin/env python

from selenium import webdriver

capabilities = {
    "browserName": "chrome",
    "version": "79.0",
    "enableVNC": True,
    "enableVideo": False
}

driver = webdriver.Remote(
    command_executor="http://172.0.0.1:4444/wd/hub",
    desired_capabilities=capabilities)

driver.maximize_window()
driver.get('https://www.google.com/')
driver.save_screenshot('google.png')
driver.close()
driver.quit()
```

[1]: https://aerokube.com/selenoid/latest/
