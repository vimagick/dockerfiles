esphome
=======

[ESPHome][1] is a system to control your ESP8266/ESP32 by simple yet powerful
configuration files and control them remotely through Home Automation systems.

## up and running

```bash
$ docker-compose up -d
$ curl http://127.0.0.1:6052
```

## flashing new device

```bash
$ udevadm info -q property -n /dev/ttyACM0 --property=ID_SERIAL
$ docker compose exec esphome bash
>>> cd /config
>>> esphome ibeacon.yaml run
====== [SUCCESS] Took 253.61 seconds ======
INFO Successfully compiled program.
Found multiple options for uploading, please choose one:
  [1] /dev/ttyACM0 (USB JTAG/serial debug unit)
  [2] Over The Air (esphome-esp32c3-ibeacon.local)
(number): 1
INFO Successfully uploaded program.
INFO Starting log output from /dev/ttyACM0 with baud rate 115200
^C
>>> ping esphome-esp32c3-ibeacon.lan
>>> exit
```

[1]: https://esphome.io/
