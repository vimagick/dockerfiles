home-assistant
==============

![](https://home-assistant.io/demo/favicon-192x192.png)

[Home Assistant][1] is an open-source home automation platform running on
Python 3. Track and control all devices at home and automate control. Perfect
to run on a Raspberry Pi.

## directory tree

```
~/fig/hass/
├── data/
│   ├── automations.yaml
│   ├── configuration.yaml
│   ├── device_trackers.yaml
│   ├── groups.yaml
│   ├── known_devices.yaml
│   └── secrets.yaml
└── docker-compose.yml
```

Click [here][3] to get latitude and longitude.

## docker-compose.yml

Lightweight without bluetooth [trackers][2]

```yaml
hass:
  image: vimagick/hass
  volumes:
    - ./data:/etc/hass
  net: host
  restart: unless-stopped
```

Heavyweight with bluetooth [trackers][2]

```yaml
hass:
  image: vimagick/hass:debian
  volumes:
    - ./data:/etc/hass
  net: host
  privileged: yes
  restart: unless-stopped
```

## up and running

```bash
$ docker-compose up -d
$ docker-compose logs -f
$ curl http://localhost:8123
```

```bash
# Error during Bluetooth LE scan: Invalid device!
$ sudo hciconfig hci0 down
$ sudo hciconfig hci0 up
```

> More python packages will be installed during startup automatically.

## quick start

```yaml
# configuration.yaml
automation: !include automations.yaml
device_tracker: !include device_trackers.yaml
group: !include groups.yaml

mqtt:
  broker: iot.eclipse.org
  port: 8883
  certificate: auto
  username: !secret mqtt_username
  password: !secret mqtt_password
```

```yaml
# secrets.yaml
mqtt_username: YOUR_MQTT_USERNAME
http_password: YOUR_MQTT_PASSWORD
```

```yaml
# groups.yaml
default_view:
  view: yes
  entities:
    - group.living_room
    - group.bedroom
Living Room:
  view: no
  entities:
    - device_tracker.band
    - device_tracker.iphone
Bedroom:
  view: no
  entities:
    - device_tracker.android
```

```yaml
# device_trackers.yaml
- platform: bluetooth_le_tracker
  interval_seconds: 30
  consider_home: 120
  track_new_devices: no
- platform: ubus
  host: 192.168.1.1
  username: root
  password: ********
  track_new_devices: no
```

```yaml
# known_devices.yaml
mi_band_2:
  hide_if_away: false
  mac: BLE_D7:3D:97:88:88:88
  name: Band
  gravatar: vimagick@gmail.com
  picture:
  track: true
  vendor: unknown

kevin_iphone:
  hide_if_away: false
  mac: 48:A1:95:88:88:88
  name: iPhone
  picture: https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/80px-Apple_logo_black.svg.png
  track: true
  vendor: Apple, Inc.

kevin_android:
  hide_if_away: false
  mac: 8C:70:5A:88:88:88
  name: Android
  picture: https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Android_robot_2014.svg/75px-Android_robot_2014.svg.png
  track: true
  vendor: unknown
```

## setup mosquitto

Use `vimagick/mosquitto:latest` with letsencrypt free certificates.

- https://github.com/vimagick/dockerfiles/tree/master/mosquitto
- https://mosquitto.org/man/mosquitto-conf-5.html
- https://github.com/vimagick/dockerfiles/tree/master/certbot

## setup ibeacon

Use `vimagick/hass:latest`, and disable bluetooth device tracker.

- https://joost.oostdijk.net/articles/playing_with_ble_on_an_onion_omega/
- https://home-assistant.io/blog/2016/04/30/ibeacons-part-1-making-presence-detection-work-better/
- https://home-assistant.io/blog/2016/05/26/ibeacons-how-to-track-things-that-cant-track-themselves-part-ii/
- http://owntracks.org/booklet/tech/json/
- https://play.google.com/store/apps/details?id=de.flurp.beaconscanner.app&hl=en

[1]: https://home-assistant.io/
[2]: https://home-assistant.io/components/device_tracker/
[3]: http://api.map.baidu.com/lbsapi/getpoint/index.html
