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
udevadm info -q property -n /dev/ttyUSB0 --property=ID_MODEL
./cc2538-bsl.py --bootloader-sonoff-usb -p /dev/ttyUSB0 -evw CC1352P2_CC2652P_launchpad_coordinator_20230507.hex
```

## Up and Running

```bash
$ docker compose up -d
$ curl 127.0.0.1:8080
```

[1]: https://github.com/Koenkk/zigbee2mqtt
[2]: https://zigbee.blakadder.com/Sonoff_ZBDongle-P.html
