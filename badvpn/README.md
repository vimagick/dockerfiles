badvpn
======

## Build Binaries

```bash
apt-get install build-essential cmake
wget https://github.com/ambrop72/badvpn/archive/1.999.130.tar.gz
tar xzf 1.999.130.tar.gz
cd badvpn-1.999.130
mkdir build
cd build
cmake -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_TUN2SOCKS=1 -DBUILD_UDPGW=1 ..
make install
ls /usr/local/bin/
```

## Server Setup

```bash
badvpn-udpgw --listen-addr 0.0.0.0:7300
```

## Client Setup

```bash
systemctl start shadowsocks-libev@jp

ip tuntap add dev tun0 mode tun user root
ip addr add 10.0.0.1/24 dev tun0
ip link set tun0 up

badvpn-tun2socks --tundev tun0 \
                 --netif-ipaddr 10.0.0.2 \
                 --netif-netmask 255.255.255.0 \
                 --socks-server-addr 127.0.0.1:1080 \
                 --udpgw-remote-server-addr 45.32.57.113:7300

ip route add 45.32.57.113 via 192.168.31.1
ip route add 0.0.0.0/1 via 10.0.0.2
ip route add 128.0.0.0/1 via 10.0.0.2
```

## Client Test

```bash
# ICMP (Failed)
ping ifconfig.co

# TCP/UDP (Success)
curl ifconfig.co
```

## References

- <https://code.google.com/archive/p/badvpn/wikis/tun2socks.wiki>
