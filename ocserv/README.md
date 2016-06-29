ocserv
======

![](https://badge.imagelayers.io/vimagick/ocserv:latest.svg)

[OpenConnect server][1] (ocserv) is an SSL VPN server. Its purpose is to be a
secure, small, fast and configurable VPN server.

## docker-compose.yml

```yaml
ocserv:
  image: vimagick/ocserv
  ports:
    - "4443:443/tcp"
    - "4443:443/udp"
  environment:
    - VPN_DOMAIN=vpn.easypi.info
    - VPN_NETWORK=10.20.30.0
    - VPN_NETMASK=255.255.255.0
    - VPN_USERNAME=username
    - VPN_PASSWORD=password
  cap_add:
    - NET_ADMIN
  restart: always
```

> - :warning: Please choose a strong password to protect VPN service.
> - These environment variables are used to generate config files/keys.
> - VPN accounts can be managed via [ocpasswd][2] command.
> - You can edit the config file [/etc/ocserv/ocserv.conf][3], then restart service.

## up and running

```bash
$ docker-compose up -d
$ docker-compose exec ocserv bash
>>> cd /etc/ocserv/
>>> ocpasswd -c /etc/ocserv/ocpasswd username
    Enter password: ******
    Re-enter password: ******
>>> exit
$ docker cp ocserv_ocserv_1:/etc/ocserv/certs/client.p12 .
$ docker-compose logs -f
```

## android client

There are two auth types:

- :-1: passwd: type everytime
- :+1: certificate: import once

```
AnyConnect ->
  Connection ->
    Add New VPN Connection... ->
      Advanced Preferences... ->
        Certificate ->
          Import ->
            File System
```

[1]: http://www.infradead.org/ocserv/
[2]: http://www.gnutls.org/manual/html_node/certtool-Invocation.html
[3]: http://www.infradead.org/ocserv/manual.html
