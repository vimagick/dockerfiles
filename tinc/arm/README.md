tinc-client
===========

```
[root@alarmpi ~]# mkdir -p /etc/tinc/netname/hosts

[root@alarmpi ~]# cat > /etc/tinc/netname/tinc.conf
Name = alarmpi
Interface = tun0
ConnectTo = server

[root@alarmpi ~]# cat > /etc/tinc/netname/hosts/alarmpi
Subnet = 10.0.0.2

[root@alarmpi ~]# tincd -n netname -K
Generating 2048 bits keys:
.................................................+++ p
.................................................+++ q
Done.
Please enter a file to save private RSA key to [/etc/tinc/netname/rsa_key.priv]:
Please enter a file to save public RSA key to [/etc/tinc/netname/hosts/alarmpi]:

[root@alarmpi ~]# cat > /etc/tinc/netname/tinc-up
#!/bin/sh
ip link set $INTERFACE up
ip addr add  10.0.0.2/24 dev $INTERFACE

[root@alarmpi ~]# cat > /etc/tinc/netname/tinc-down
#!/bin/sh
ip addr del 10.0.0.2/24 dev $INTERFACE
ip link set $INTERFACE down

[root@alarmpi ~]# cat > /etc/tinc/netname/hosts/server-up
#!/bin/sh
ORIGINAL_GATEWAY=`ip route show | grep ^default | cut -d ' ' -f 2-3`
ip route add $REMOTEADDRESS $ORIGINAL_GATEWAY
ip route add 0.0.0.0/1 dev $INTERFACE
ip route add 128.0.0.0/1 dev $INTERFACE

[root@alarmpi ~]# cat > /etc/tinc/netname/hosts/server-down
#!/bin/sh
ORIGINAL_GATEWAY=`ip route show | grep ^default | cut -d ' ' -f 2-3`
ip route del $REMOTEADDRESS $ORIGINAL_GATEWAY
ip route del 0.0.0.0/1 dev $INTERFACE
ip route del 128.0.0.0/1 dev $INTERFACE

[root@alarmpi ~]# chmod +x /etc/tinc/netname/tinc-{up,down}
[root@alarmpi ~]# chmod +x /etc/tinc/netname/hosts/server-{up,down}

[root@alarmpi ~]# scp /etc/tinc/netname/hosts/alarmpi root@remote-server:/etc/tinc/netname/hosts/
[root@alarmpi ~]# scp root@remote-server:/etc/tinc/netname/hosts/server /etc/tinc/netname/hosts/

[root@alarmpi ~]# tree -AF /etc/tinc/
/etc/tinc/
└── netname/
    ├── hosts/
    │   ├── alarmpi
    │   ├── server
    │   ├── server-down
    │   └── server-up
    ├── rsa_key.priv
    ├── tinc-down*
    ├── tinc-up*
    └── tinc.conf

[root@alarmpi ~]# cat > /etc/systemd/network/eth0.network
[Match]
Name=eth0

[Network]
DHCP=yes
UseDNS=false
DNS=8.8.8.8
IPMasquerade=yes

[root@alarmpi ~]# cat > /etc/sysctl.d/99-sysctl.conf
net.ipv4.ip_forward=1
net.ipv6.conf.all.disable_ipv6=1
[root@alarmpi ~]# systemctl restart systemd-sysctl

[root@alarmpi ~]# iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE
[root@alarmpi ~]# iptables-save > /etc/iptables/iptables.rules
[root@alarmpi ~]# systemctl enable iptables

[root@alarmpi ~]# systemctl start tincd@netname
[root@alarmpi ~]# systemctl status tincd@netname
[root@alarmpi ~]# systemctl enable tincd@netname
```
