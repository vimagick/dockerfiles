pptpd
=====

[![](https://badge.imagelayers.io/vimagick/pptpd:latest.svg)](https://imagelayers.io/?images=vimagick/pptpd:latest)

The Point-to-Point Tunneling Protocol is a method for implementing virtual private networks.
PPTP uses a control channel over TCP and a GRE tunnel operating to encapsulate PPP packets.

## docker-compose.yml

```
pptpd:
  image: vimagick/pptpd
  volumes:
    - ./pptpd.conf:/etc/pptpd.conf
    - ./pptpd-options:/etc/ppp/pptpd-options
    - ./chap-secrets:/etc/ppp/chap-secrets
  privileged: true
  restart: always
```

## server

```
$ modprobe nf_conntrack_pptp nf_nat_pptp
$ docker-compose up -d
```

You need to config firewall:

- To let PPTP tunnel maintenance traffic, `allow port 1723/tcp`.
- To let PPTP tunneled data to pass through router, `allow proto gre`.
- Set `net.ipv4.ip_forward=1`
- Set `DEFAULT_FORWARD_POLICY=ACCEPT`
