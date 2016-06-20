pxe
===

The Preboot Execution Environment (PXE) is an environment to bootstrap
computers using a network card (i.e Ethernet, Token-Ring) independently of
available data storage devices (like hard disks) or installed operating
systems.

## docker-compose.yml
```yaml
pxe:
  image: vimagick/dnsmasq
  volumes:
    - ./dnsmasq.conf:/etc/dnsmasq.d/dnsmasq.conf
    - ./tftpboot:/tftpboot
  net: host
  restart: always
```

## dnsmasq.conf

```
interface=eth0
port=0
no-hosts
no-resolv
server=8.8.8.8
dhcp-range=192.168.1.10,192.168.1.20,1h
dhcp-option=3,192.168.1.1
dhcp-option=6,192.168.1.1
dhcp-boot=pxelinux.0
enable-tftp
tftp-root=/tftpboot
```

> You can get all `dhcp-option` codes via `dnsmasq --help dhcp`.

## up and running

```bash
cd ~/fig/pxe/

mkdir tftpboot
wget http://ftp.nl.debian.org/debian/dists/jessie/main/installer-amd64/current/images/netboot/netboot.tar.gz
tar xzf netboot.tar.gz -C tftpboot

docker-compose up -d
docker-compose logs -f
```

> You should stop DHCP service on local network.
