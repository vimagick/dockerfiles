tinc
====

![](https://badge.imagelayers.io/vimagick/tinc:latest.svg)

[tinc][1] is a Virtual Private Network (VPN) daemon that uses tunnelling and
encryption to create a secure private network between hosts on the Internet.

To use this image, you need to:

- Have baisc knowledges of tinc
- Create a directory tree by hand ([tutor][2])
- Use `docker-compose` to manage

## directory tree

```
~/fig/tinc/
├── docker-compose.yml
└── tinc/
    └── netname/
        ├── hosts/
        │   ├── client
        │   ├── client-down*
        │   ├── client-up*
        │   └── server
        ├── rsa_key.priv
        ├── tinc.conf
        ├── tinc-down*
        └── tinc-up*
```

## docker-compose.yml

```yaml
tinc:
  image: vimagick/tinc
  ports:
    - "655:655/tcp"
    - "655:655/udp"
  volumes:
    - ./tinc:/etc/tinc
  environment:
    - VERBOSE=2
  cap_add:
    - NET_ADMIN
  dns: 8.8.8.8
  restart: always
```

## server

```bash
# config
$ cd ~/fig/tinc/
$ mkdir -p tinc/netname/hosts/
$ docker-compose run --rm tinc sh
>>> cat > tinc.conf
Name=server
Interface=tun0
>>> cat > hosts/server
Subnet=10.0.0.1
Subnet=0.0.0.0/0
>>> tincd -n netname -K4096 < /dev/null
>>> cat > tinc-up
ifconfig $INTERFACE 10.0.0.1 netmask 255.255.255.0
>>> cat > tinc-down
ifconfig $INTERFACE down
>>> chmod +x tinc-up tinc-down
>>> exit

# run
$ docker-compose up -d

# monitor
$ docker-compose logs

# stats
$ watch docker exec tinc_tinc_1 netstat -an
```

## client

```bash
# start
$ tincd -d -D -n netname --pidfile /tmp/tinc.pid

# stop
$ tincd -k --pidfile /tmp/tinc.pid
```

## client (openwrt)

```bash
$ opkg install tinc ip
 
$ cat > /etc/config/tinc
config tinc-net netname
    option enabled 1
config tinc-host linkit
    option enabled 1
    option net netname
config tinc-host server
    option enabled 1
    option net netname
 
$ mkdir -p /etc/tinc/netname/hosts
 
$ cat > /etc/tinc/netname/tinc.conf
Name = linkit
Interface = tun0
ConnectTo = server
 
$ cat > /etc/tinc/netname/hosts/linkit
Subnet = 10.0.0.125
 
$ tincd -n netname -K < /dev/null
Generating 2048 bits keys:
......+++ p
.....+++ q
Done.
 
$ cat > /etc/tinc/netname/tinc-up
#!/bin/sh
ip link set $INTERFACE up
ip addr add  10.0.0.125/24 dev $INTERFACE
 
$ cat > /etc/tinc/netname/tinc-down
#!/bin/sh
ip addr del 10.0.0.125/24 dev $INTERFACE
ip link set $INTERFACE down
 
$ cat > /etc/tinc/netname/hosts/server-up
#!/bin/sh
ORIGINAL_GATEWAY=`ip route show | grep ^default | cut -d ' ' -f 2-3`
ip route add $REMOTEADDRESS $ORIGINAL_GATEWAY
ip route add 0.0.0.0/1 dev $INTERFACE
ip route add 128.0.0.0/1 dev $INTERFACE
 
$ cat > /etc/tinc/netname/hosts/server-down
#!/bin/sh
ORIGINAL_GATEWAY=`ip route show | grep ^default | cut -d ' ' -f 2-3`
ip route del $REMOTEADDRESS $ORIGINAL_GATEWAY
ip route del 0.0.0.0/1 dev $INTERFACE
ip route del 128.0.0.0/1 dev $INTERFACE
 
$ chmod +x /etc/tinc/netname/tinc-*
$ chmod +x /etc/tinc/netname/hosts/server-*
 
$ scp /etc/tinc/netname/hosts/linkit root@remote-server:/etc/tinc/netname/hosts/
$ scp root@remote-server:/etc/tinc/netname/hosts/server /etc/tinc/netname/hosts/
 
$ /etc/init.d/tinc start
$ /etc/init.d/tinc enable
 
$ ifconfig tun0
 
$ firefox http://192.168.1.125/cgi-bin/luci/
 
# Firewall:
# | lan => wan, vpn | ooo | xx |
# | wan =>          | oox | oo |
# | vpn => wan      | ooo | ox |
```

[1]: http://tinc-vpn.org/
[2]: https://www.digitalocean.com/community/tutorials/how-to-install-tinc-and-set-up-a-basic-vpn-on-ubuntu-14-04
