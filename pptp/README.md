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
  net: host
  privileged: yes
  restart: unless-stopped
```

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
