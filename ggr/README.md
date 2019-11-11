ggr
===

Go Grid Router (aka [Ggr][1]) is a lightweight active load balancer used to
create scalable and highly-available Selenium clusters.

```bash
$ docker stack deploy -c docker-stack.yml ggr
$ docker run --rm -it alpine sh
>>> apk update
>>> apk add bind-tools
>>> dig tasks.chrome
```

```bash
$ curl http://127.0.0.1:4444/ping
{
  "uptime": "29h48m31.005125621s",
  "lastReloadTime": "2019-11-02T20:27:53Z",
  "numRequests": 859704,
  "numSessions": 8241,
  "version": "1.6.6"
}

$ curl http://127.0.0.1:4444/quota
[
  {
    "Name": "chrome",
    "DefaultVersion": "78.0",
    "DefaultPlatform": "",
    "Versions": [
      {
        "Number": "78.0",
        "Platform": "",
        "Regions": [
          {
            "Name": "1",
            "Hosts": [
              {
                "Name": "10.0.108.8",
                "Port": 5555,
                "Count": 10,
                "Username": "",
                "Password": "",
                "VNC": "",
                "Scheme": ""
              }
            ]
          }
        ]
      }
    ]
  }
]

$ curl -X POST http://127.0.0.1:4444/wd/hub/session -d '{"desiredCapabilities":{"browserName": "chrome"}}'
{
  "sessionId": "1d84d09822d2d54371e9bc1f3b98264536022f4ccf5ae1756a9fac0a05defd6b",
  "status": 0,
  "value": {
    "acceptInsecureCerts": false,
    "browserName": "chrome",
    "browserVersion": "78.0.3904.70",
    "chrome": {
      "chromedriverVersion": "78.0.3904.70 (edb9c9f3de0247fd912a77b7f6cae7447f6d3ad5-refs/branch-heads/3904@{#800})",
      "userDataDir": "/tmp/.com.google.Chrome.HhulSt"
    }
  }
}

$ curl http://127.0.0.1:4444/host/1d84d09822d2d54371e9bc1f3b98264536022f4ccf5ae1756a9fac0a05defd6b
{
  "Name": "10.0.108.8",
  "Port": 5555,
  "Count": 10,
  "Username": "",
  "Password": "",
  "VNC": "",
  "Scheme": ""
}
```

[1]: https://github.com/aerokube/ggr

