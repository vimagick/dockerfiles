mqtt-io
=======

[mqtt-io][1] exposes general purpose inputs and outputs (GPIO), hardware sensors and
serial devices to an MQTT server. Ideal for single-board computers such as the
Raspberry Pi.

## up and running

```
docker-compose up -d
docker-compose logs -f
```

## mqtt sub/pub

```
mosquitto_sub -v -h test.mosquitto.org -t easypi/#
mosquitto_pub -h test.mosquitto.org -t easypi/output/light/set -m ON
```

[1]: https://mqtt-io.app/
