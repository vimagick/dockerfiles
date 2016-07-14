openwrt
=======

Build OpenWrt Package/Image For Raspberry Pi

## docker-compose.yml

```yaml
openwrt:
  image: vimagick/openwrt
  container_name: openwrt
  command: sleep inf
  volumes:
    - ./data:/data
```

## up and running

```bash
$ mkdir -m 777 data
$ docker-compose up -d
$ docker-compose exec openwrt bash
>>> cd ~/sdk
>>> ln -s /data bin

>>> ./scripts/feeds update -a
>>> ./scripts/feeds list
>>> ./scripts/feeds search vim
>>> ./scripts/feeds install vim tmux htop
>>> make V=s

>>> export TERM=xterm
>>> git clone https://github.com/shadowsocks/openwrt-shadowsocks.git package/shadowsocks-libev
>>> make menuconfig
>>> make package/shadowsocks-libev/compile V=99

>>> tree -dF /data/
/data/
└── brcm2708
    └── packages
        ├── base
        ├── luci
        ├── management
        ├── packages
        ├── routing
        └── telephony
```

## install packages

```bash
$ opkg install tmux_1.9a-1_brcm2708.ipk htop_1.0.3-1_brcm2708.ipk
$ tmux new htop
```
