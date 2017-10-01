shairplay
=========

[Shairplay][1] is a free portable AirPlay server implementation similar to [ShairPort][2].
Currently only AirPort Express emulation is supported.

## docker-compose.yml

```yaml
shairplay:
  image: easypi/shairplay-arm
  devices:
    - /dev/snd
  environment:
    - APNAME=EasyPi
  net: host
  restart: unless-stopped
```

## Quick Start

On MacOSX: click 🔉  to show a list of output devices, then click `EasyPi` to connect.

```bash
# Enable Audio
$ grep audio /boot/config.txt
dtparam=audio=on

# Start Container
$ docker-compose up -d

# Control Volume
$ docker-compose exec shairplay alsamixer
>>> Press ↑ to volume up
>>> Press ↓ to volume down
>>> Press ESC to quit
```

[1]: https://github.com/juhovh/shairplay
[2]: https://github.com/abrasive/shairport
