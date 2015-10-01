etcd-arm
========

![](https://badge.imagelayers.io/vimagick/etcd-arm:latest.svg)

![](https://coreos.com/assets/images/media/Fleet-Scheduling.png)

## Cross compilation for Raspberry Pi

```
git clone https://github.com/coreos/etcd.git
cd etcd
# ARMv6
GOOS=linux GOARCH=arm GOARM=6 ./build
scp bin/* pi1:/usr/local/bin
# ARMv7
GOOS=linux GOARCH=arm GOARM=7 ./build
scp bin/* pi2:/usr/local/bin
```
