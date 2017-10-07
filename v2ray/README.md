v2ray
=====

[v2ray][1] is a platform for building proxies to bypass network restrictions.

```yaml
v2ray:
  image: v2ray/official
  ports:
    - "8001:8001"
  volumes:
    - ./data:/etc/v2ray
  restart: always
```

Download sample [config.json][2].

[1]: https://www.v2ray.com/
[2]: https://github.com/v2ray/install/raw/master/docker/official/config.json
