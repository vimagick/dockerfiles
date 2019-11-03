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
- selenoid/chrome:78.0
- selenoid/firefox:70.0
- selenoid/vnc:chrome_78.0
- selenoid/vnc:firefox_70.0

```json
{
  "chrome": {
    "default": "78.0",
    "versions": {
      "78.0": {
        "image": "selenoid/vnc:chrome_78.0",
        "port": "4444"
      }
    }
  },
  "firefox": {
    "default": "70.0",
    "versions": {
      "70.0": {
        "image": "selenoid/vnc:firefox_70.0",
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
    "version": "78.0",
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
