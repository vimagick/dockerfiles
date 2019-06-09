i2pd
====

[i2pd][1] (I2P Daemon) is a full-featured C++ implementation of I2P client.

## docker-compose.yml

```yaml
i2pd:
  image: vimagick/i2pd
  ports:
    - "4444:4444"
    - "4447:4447"
    - "7070:7070"
  volumes:
    - ./data/i2pd.conf:/etc/i2pd/i2pd.conf
    - ./data/tunnels.conf.d:/etc/i2pd/tunnels.conf.d
  restart: unless-stopped
```

## Server

```bash
$ docker-compose up -d
$ curl http://127.0.0.1:7070/
```

## Tunnel

- You can find examples in: /usr/share/doc/i2pd/tunnels.d/
- Document: https://github.com/PurpleI2P/i2pd/wiki/tunnels.conf

## Client

Download [FoxyProxy][2] for Firefox.

## Example Sites

- http://planet.i2p
- http://identiguy.i2p
- http://tracker2.postman.i2p

[1]: https://github.com/PurpleI2P/i2pd
[2]: https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/
