open-vmdk
=========

[Open VMDK][1] is an assistant tool for creating Open Virtual Appliance (OVA).

## Tutorial

```bash
# create aliases
$ alias vmdk-convert='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data -w /data vimagick/open-vmdk vmdk-convert'
$ alias ova-compose='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data -w /data vimagick/open-vmdk ova-compose'

# convert raw image
$ wget https://downloads.openwrt.org/releases/23.05.5/targets/x86/64/openwrt-23.05.5-x86-64-generic-ext4-combined.img.gz
$ gunzip openwrt-23.05.5-x86-64-generic-ext4-combined.img.gz
$ vmdk-convert openwrt-23.05.5-x86-64-generic-ext4-combined.img openwrt-23.05.5-x86-64-generic-ext4-combined.vmdk
```

[1]: https://github.com/vmware/open-vmdk
