openwrt
=======

Build OpenWrt Package/Image For Raspberry Pi

## docker-compose.yml

```yaml
openwrt:
  image: vimagick/openwrt:bcm2710
  container_name: openwrt_bcm2710
  command: sleep inf
  volumes:
    - ./data/bcm2710:/data
  restart: unless-stopped
```

## up and running

```bash
$ docker-compose up -d
$ docker-compose exec openwrt bash
>>> cd ~/sdk
>>> sudo chmod 777 /data
>>> ln -s /data bin

>>> ./scripts/feeds update -a
>>> ./scripts/feeds list
>>> ./scripts/feeds search vim
>>> ./scripts/feeds install vim tmux htop
>>> make V=s

>>> export TERM=xterm
>>> sudo apt install -y asciidoc xmlto
>>> git clone https://github.com/shadowsocks/openwrt-shadowsocks.git package/shadowsocks-libev
>>> vi package/shadowsocks-libev/Makefile
- Package/shadowsocks-libev-spec = $(call Package/shadowsocks-libev/Default,openssl,(OpenSSL),+libopenssl +libpthread +ipset +ip)
+ Package/shadowsocks-libev-spec = $(call Package/shadowsocks-libev/Default,openssl,(OpenSSL),+libopenssl +libpthread +ipset +ip +iptables-mod-tproxy +zlib)
>>> make menuconfig # Network ▷ shadowsocks-libev-spec ▷ Save ▷ Exit
>>> make package/zlib/compile V=s
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
