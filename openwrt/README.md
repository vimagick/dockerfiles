openwrt
=======

Build OpenWrt Package/Image For Raspberry Pi

## docker-compose.yml

```yaml
openwrt:
  image: vimagick/openwrt
  command: sleep infinity
  environment:
    - TERM=xterm
  restart: unless-stopped

bcm2708:
  extends:
    service: openwrt
  image: vimagick/openwrt:bcm2708
  volumes:
    - ./data/bcm2708:/data
```

## up and running

```bash
$ docker-compose up -d bcm2708
$ docker-compose exec bcm2708 bash
>>> cd ~/sdk
>>> sudo chmod 777 /data

>>> ./scripts/feeds update -a
>>> ./scripts/feeds list
>>> ./scripts/feeds search vim
>>> ./scripts/feeds install vim tmux htop
>>> make V=s

>>> sudo apt install -y asciidoc xmlto
>>> git clone https://github.com/shadowsocks/openwrt-shadowsocks.git package/shadowsocks-libev
>>> vi package/shadowsocks-libev/Makefile
- Package/shadowsocks-libev-spec = $(call Package/shadowsocks-libev/Default,openssl,(OpenSSL),+libopenssl +libpthread +ipset +ip)
+ Package/shadowsocks-libev-spec = $(call Package/shadowsocks-libev/Default,openssl,(OpenSSL),+libopenssl +libpthread +ipset +ip +iptables-mod-tproxy +zlib)
>>> make menuconfig # Network ▷ shadowsocks-libev-spec ▷ Save ▷ Exit
>>> make package/shadowsocks-libev/compile V=s

>>> tree -dF /data/
/data/
└── brcm2708/
    └── packages/
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

## read more

- <https://wiki.openwrt.org/doc/howto/build>
