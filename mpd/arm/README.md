Music Player Daemon
===================

## Raspberry Pi OS

Audio is enabled by default

## ArchLinuxArm

```bash
$ echo 'snd-bcm2835' > /etc/modules-load.d/raspberrypi.conf
$ echo 'dtparam=audio=on' >> /boot/config.txt
$ reboot
```
