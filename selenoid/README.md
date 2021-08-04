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
│   └── videos/
└── docker-compose.yml
```

Required Images
---------------

- aerokube/selenoid:latest-release
- aerokube/selenoid-ui:latest-release
- selenoid/video-recorder:latest-release
- selenoid/chrome:92.0
- selenoid/firefox:90.0
- selenoid/opera:77.0
- selenoid/vnc:chrome_92.0
- selenoid/vnc:firefox_90.0
- selenoid/vnc:opera_77.0

```json
{
  "chrome": {
    "default": "92.0",
    "versions": {
      "92.0": {
        "image": "selenoid/vnc:chrome_92.0",
        "port": "4444"
      }
    }
  },
  "firefox": {
    "default": "90.0",
    "versions": {
      "90.0": {
        "image": "selenoid/vnc:firefox_90.0",
        "port": "4444"
      }
    }
  },
  "opera": {
    "default": "77.0",
    "versions": {
      "77.0": {
        "image": "selenoid/vnc:opera_77.0",
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
    "version": "92.0",
    "selenoid:options": {
        "enableVNC": True,
        "enableVideo": True,
        "videoName": "test.mp4",
    },
    "goog:chromeOptions": {
        "args": ["--disable-gpu"],
    },
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
