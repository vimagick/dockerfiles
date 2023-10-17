pptp
====

Containerized PPTP Client

## up and running

```
sudo modprobe nf_conntrack_pptp nf_conntrack_proto_gre

docker-compose up -d
docker-compose logs -f

ip link show
ip addr show
ip route show

curl ipinfo.io
```

## references

- <http://pptpclient.sourceforge.net/howto-debian.phtml>
- <https://wiki.archlinux.org/index.php/PPTP_Client>
