hans
====

[Hans][1] makes it possible to tunnel IPv4 through ICMP echo packets, so you
could call it a ping tunnel.

## docker-compose.yml

```yaml
hans:
  image: vimagick/hans
  environment:
    - NETWORK=10.1.2.0
    - PASSWORD=password
  net: host
  privileged: yes
  restart: always
```

## Server Setup

```bash
$ docker-compose up -d
```

## Client Setup

```bash
# Run Client Program
$ hans -f -c 1.2.3.4 -p password

# Access Server Directly
$ ip route add 1.2.3.4 via 192.168.1.1

# Change Default Route (Method A)
$ ip route change default via 10.1.2.1

# Change Default Route (Method B)
$ ip route add 0.0.0.0/1 dev tun0
$ ip route add 128.0.0.0/1 dev tun0
```

[1]: http://code.gerade.org/hans/
