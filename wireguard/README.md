wireguard
=========

## Install Kernel Module

```bash
$ apt update
$ apt install -y dirmngr raspberrypi-kernel-headers
$ echo 'deb http://deb.debian.org/debian/ unstable main' > /etc/apt/sources.list.d/unstable-wireguard.list
$ printf 'Package: *\nPin: release a=unstable\nPin-Priority: 150\n' > /etc/apt/preferences.d/limit-unstable
$ apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 04EE7237B7D453EC
$ apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
$ apt update
$ apt install -y wireguard-dkms
$ modprobe wireguard
$ lsmod | grep wireguard
```

## Generate Keys

```bash
$ umask 077
$ wg genkey | tee privatekey | wg pubkey > publickey
```

## Create Config

```ini
[Interface]
Address = 192.168.32.1/24
ListenPort = 51820
PrivateKey = SMDPkZPE6R9VyqT3ucxE5v//GnIzzruYC0MPD5efr3w=
PostUp = iptables -t nat -A POSTROUTING -s 192.168.32.0/24 -j MASQUERADE; iptables -t filter -A FORWARD -j ACCEPT
PreDown = iptables -t nat -D POSTROUTING -s 192.168.32.0/24 -j MASQUERADE; iptables -t filter -D FORWARD -j ACCEPT

# [Peer]
# PublicKey = VMK48tEcTLBwzxS+2gx3MH4IRlE7upTKPkYIE/xa7S0=
# AllowedIPs = 192.168.32.2/32
```
