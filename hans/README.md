hans
====

[Hans][1] makes it possible to tunnel IPv4 through ICMP echo packets, so you
could call it a ping tunnel.

## How It Works

```
Client ---> G.F.W ---> Server ---> Internet
 tun0       ping        tun0
```

## docker-compose.yml

```yaml
server:
  image: vimagick/hans
  environment:
    - NETWORK=10.1.2.0
    - PASSWORD=password
  net: host
  privileged: yes
  restart: always

client:
  image: easypi/hans-arm
  environment:
    - SERVER=1.2.3.4
    - PASSWORD=password
  net: host
  privileged: yes
  restart: always
```

## Server Setup

```bash
# Start Server Container
$ docker-compose up -d server

# Enable Masquerade (Method A)
$ iptables -t nat -A POSTROUTING -s 10.1.2.0/24 -o eth0 -j MASQUERADE

# Enable Masquerade (Method B)
$ firewall-cmd --add-masquerade
```

## Client Setup

```bash
# Start Client Container
$ docker-compose up -d client

# Access Server Directly
$ ip route add 1.2.3.4 via 192.168.1.1

# Change Default Route (Method A)
$ ip route change default via 10.1.2.1

# Change Default Route (Method B)
$ ip route add 0.0.0.0/1 dev tun0
$ ip route add 128.0.0.0/1 dev tun0

# Enable IP Forwarding
$ sysctl -w net.ipv4.ip_forward=1
$ iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o tun0 -j MASQUERADE
```

[1]: http://code.gerade.org/hans/
