shairplay
=========

[Shairplay][1] is a free portable AirPlay server implementation similar to [ShairPort][2].
Currently only AirPort Express emulation is supported.

## docker-compose.yml

```yaml
shairplay:
  image: easypi/shairplay-arm
  command: shairplay --apname=EasyPi --hwaddr=01:45:89:ab:cd:ef
  volumes:
    - /var/run/dbus:/var/run/dbus
  devices:
    - /dev/snd
  net: host
  restart: unless-stopped
```

[1]: https://github.com/juhovh/shairplay
[2]: https://github.com/abrasive/shairport
