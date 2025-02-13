zigbee2mqtt
===========

[Zigbee2MQTT][1] allows you to use your Zigbee devices without the vendor's bridge or gateway.

## Firmware Upgrade

[Zigbee 3.0 CC2652P Dongle Plus][2]

```bash
# download latest zigbee firmware
wget https://github.com/Koenkk/Z-Stack-firmware/raw/master/coordinator/Z-Stack_3.x.0/bin/CC1352P2_CC2652P_launchpad_coordinator_20230507.zip
unzip CC1352P2_CC2652P_launchpad_coordinator_20230507.zip
ls CC1352P2_CC2652P_launchpad_coordinator_20230507.hex

# download firmware flashing tool
sudo apt install -y python3-serial python3-intelhex
wget https://github.com/JelmerT/cc2538-bsl/raw/master/cc2538-bsl.py
chmod +x cc2538-bsl.py
./cc2538-bsl.py --help

ls /dev/ttyUSB*
udevadm info -q property -n /dev/ttyUSB0 --property=ID_SERIAL
./cc2538-bsl.py --bootloader-sonoff-usb -p /dev/ttyUSB0 -evw CC1352P2_CC2652P_launchpad_coordinator_20230507.hex
```

## Up and Running

```bash
$ docker compose up -d
$ vim data/configuration.yaml
$ docker compose restart
$ tree
├── data
│   ├── configuration.yaml
│   ├── coordinator_backup.json
│   ├── database.db
│   ├── log
│   │   └── 2024-01-03.16-06-42
│   │       └── log.txt
│   ├── secret.yaml
│   └── state.json
└── docker-compose.yml
$ curl 127.0.0.1:8080
```

## Example Config

File: configuration.yaml

```yaml
permit_join: false
homeassistant: false
frontend: true
mqtt:
  base_topic: zigbee2mqtt
  server: mqtts://broker.hivemq.com:8883
  ca: /etc/ssl/cert.pem
  #user: '!secret.yaml user'
  #password: '!secret.yaml password'
serial:
  adapter: zstack
  port: /dev/ttyACM0
advanced:
  pan_id: GENERATE
  ext_pan_id: GENERATE
  network_key: GENERATE
  last_seen: epoch
availability: true
```

File: secret.yaml

```yaml
user: kevin
password: kevin
```

## MQTT Testing

```bash
$ mosquitto_sub -h broker.hivemq.com -u username -P password -t 'zigbee2mqtt/+' -R -F '%I\t%t\t%p'
```

> :warning: PLEASE DO NOT USE <broker.hivemq.com> FOR PRODUCTION!

## Pro Tip for Tasmota

To bind button to switch [read more][3]

```
Rule1
  ON mqtt#connected DO Subscribe btn, zigbee2mqtt/0xaaaaaaaaaaaaaaaa, action ENDON
  ON Event#btn=single DO Publish zigbee2mqtt/0xbbbbbbbbbbbbbbbb/set {"state":"TOGGLE"} ENDON

Rule2
  ON mqtt#connected DO Subscribe btn2, dorm/zigbee2mqtt/0xcccccccccccccccc, action ENDON
  ON Event#btn2=single DO Publish dorm/zigbee2mqtt/0xdddddddddddddddd/set {"state":"ON"} ENDON
  ON Event#btn2=hold DO Publish dorm/zigbee2mqtt/0xdddddddddddddddd/set {"state":"OFF"} ENDON
```

[1]: <https://github.com/Koenkk/zigbee2mqtt>
[2]: <https://zigbee.blakadder.com/Sonoff_ZBDongle-P.html>
[3]: <https://tasmota.github.io/docs/MQTT/#subscribe>
