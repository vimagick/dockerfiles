pptp
====

Containerized PPTP Client

## docker-compose.yml

```yaml
pptp:
  image: vimagick/pptp
  environment:
    - SERVER=1.2.3.4
    - TUNNEL=vps
    - USERNAME=username
    - PASSWORD=password
    - ROUTES=0.0.0.0/1 128.0.0.0/1
  net: host
  privileged: yes
  restart: unless-stopped
```

## available parameters (passed as environment variables)

* `SERVER`: IP or hostname of the VPN server
* `TUNNEL`: name of the tunnel
* `USERNAME` / `PASSWORD`: auth info for the server
* `ROUTES`: space separated list of routes that should be routed through the VPN. By default all traffic is routed

## up and running

```
sudo modprobe nf_conntrack_pptp nf_conntrack_proto_gre

docker-compose up -d
docker-compose logs -f

ip link show
ip addr show
ip route show

curl ifconfig.co
curl ifconfig.ovh
curl ifconfig.me
```

## references

- <http://pptpclient.sourceforge.net/howto-debian.phtml>
- <https://wiki.archlinux.org/index.php/PPTP_Client>
