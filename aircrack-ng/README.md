aircrack-ng
===========

[Aircrack-ng][1] is a complete suite of tools to assess WiFi network security.

```bash
$ docker compose up -d
$ docker compose exec aircrack bash
>>> airmon-ng
>>> airmon-ng start wlan1
>>> ifconfig
>>> airodump-ng wlan1mon
>>> airmon-ng stop wlan1mon
>>> exit
```

[1]: https://github.com/aircrack-ng/aircrack-ng
