aircrack-ng
===========

```bash
docker-compose up -d

docker-compose exec aircrack bash
>>> airmon-ng

PHY     Interface       Driver          Chipset

null    wlan0           r8188eu
phy0    wlan1mon        rt2800usb

>>> airmon-ng start wlan1

PHY     Interface       Driver          Chipset

null    wlan0           r8188eu
phy0    wlan1           rt2800usb

                (mac80211 monitor mode vif enabled for [phy0]wlan1 on [phy0]wlan1mon)
                (mac80211 station mode vif disabled for [phy0]wlan1)

>>> airodump-ng wlan1mon
```
