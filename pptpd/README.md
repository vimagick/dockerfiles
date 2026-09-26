pptpd
=====

![](https://badge.imagelayers.io/vimagick/pptpd:latest.svg)

The Point-to-Point Tunneling Protocol is a method for implementing virtual private networks.

`PPTP` uses a control channel over TCP and a GRE tunnel operating to encapsulate PPP packets.

## Directory Tree

```
~/fig/pptpd/
├── docker-compose.yml
└── data/
    ├── pptpd.conf
    ├── pptpd-options
    └── chap-secrets
```

## Server Setup

```bash
# edit /etc/default/ufw (for ubuntu)
$ modprobe nf_conntrack_pptp nf_nat_pptp
$ cd ~/fig/pptpd/
$ docker-compose up -d
$ docker-compose logs -f
```

You need to config firewall:

- To let PPTP tunnel maintenance traffic, `allow port 1723/tcp`.
- To let PPTP tunneled data to pass through router, `allow proto gre`.
- Set `DEFAULT_FORWARD_POLICY=ACCEPT`
- Set `net.ipv4.ip_forward=1` (sysctl)

## Client Setup

Connect PPTP server using `username:password` with `mschap-v2/mppe-128` encyption.

## References

- <https://wiki.archlinux.org/index.php/PPTP_server>
- <https://wiki.archlinux.org/index.php/PPTP_Client>
