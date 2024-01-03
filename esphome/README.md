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
>>> esphome run ibeacon.yaml
====== [SUCCESS] Took 253.61 seconds ======
INFO Successfully compiled program.
Found multiple options for uploading, please choose one:
  [1] /dev/ttyACM0 (USB JTAG/serial debug unit)
  [2] Over The Air (esphome-esp32c3-ibeacon.local)
(number): 1
Dependency Graph
|-- AsyncTCP-esphome @ 2.0.1
|-- WiFi @ 2.0.0
|-- FS @ 2.0.0
|-- Update @ 2.0.0
|-- ESPAsyncWebServer-esphome @ 3.1.0
|-- DNSServer @ 2.0.0
|-- ESPmDNS @ 2.0.0
|-- ArduinoJson @ 6.18.5
|-- NeoPixelBus @ 2.7.3
INFO Successfully uploaded program.
INFO Starting log output from /dev/ttyACM0 with baud rate 115200
^C
>>> ping esphome-esp32c3-ibeacon.lan
^C
>>> exit
$ curl -X POST 'http://esphome-esp32c3-ibeacon.lan/light/neopixel_light/turn_on?brightness=255&r=255&g=192&b=203&white_value=0&effect=None'
$ curl http://esphome-esp32c3-ibeacon.lan/light/neopixel_light
{
  "id": "light-neopixel_light",
  "state": "ON",
  "color_mode": "rgb",
  "brightness": 255,
  "color": {
    "r": 255,
    "g": 192,
    "b": 203
  }
}
```

[1]: https://esphome.io/
