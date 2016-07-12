openvpn
=======

Setup OpenVPN on Raspberry Pi.

## docker-compose.yml

```yaml
stunnel:
  image: easypi/stunnel-arm
  ports:
    - "1194:1194"
  environment:
    - CLIENT=yes
    - SERVICE=openvpn
    - ACCEPT=0.0.0.0:1194
    - CONNECT=server:4911
  extra_hosts:
    - server:1.2.3.4
  restart: always

openvpn:
  image: easypi/openvpn-arm
  command: --config pi.ovpn
  volumes:
    - ./data:/etc/openvpn
  net: host
  privileged: yes
  restart: always

dnsmasq:
  image: easypi/dnsmasq-arm
  volumes:
    - ./data/dnsmasq.conf:/etc/dnsmasq.d/dnsmasq.conf
  cap_add:
    - NET_ADMIN
  net: host
  restart: always
```

## up and running

```bash
$ echo 'net.ipv4.ip_forward=1' > /etc/sysctl.d/local.conf
$ sysctl -p /etc/sysctl.d/local.conf

$ iptables -t nat -A POSTROUTING -s 192.168.31.0/24 -o tun0 -j MASQUERADE
$ iptables-save -t nat | grep -vi docker > /etc/iptables/iptables.rules
$ systemctl enable iptables

$ docker-compose up -d stunnel # 1st
$ docker-compose up -d openvpn # 2nd
$ docker-compose up -d dnsmasq # 3rd
$ docker-compose logs -f
```

> :warning: The order of execution is very important!
