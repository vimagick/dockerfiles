Music Player Daemon
===================

## Enable Audio Device (ArchLinuxArm)

```bash
$ echo 'snd-bcm2835' > /etc/modules-load.d/raspberrypi.conf
$ echo 'dtparam=audio=on' >> /boot/config.txt
$ reboot
```
