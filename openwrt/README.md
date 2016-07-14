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
>>> ./scripts/feeds install vim tmux htop
>>> make V=s
>>> tree /data
>>> exit
```
