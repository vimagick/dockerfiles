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
    - VPN_DOMAIN=vpn.easypi.pro
    - VPN_NETWORK=10.20.30.0
    - VPN_NETMASK=255.255.255.0
    - LAN_NETWORK=192.168.0.0
    - LAN_NETMASK=255.255.0.0
    - VPN_USERNAME=username
    - VPN_PASSWORD=password
  cap_add:
    - NET_ADMIN
  restart: always
```

> - :warning: Please choose a strong password to protect VPN service.
> - These environment variables are used to generate config files/keys.
> - VPN accounts can be managed via [ocpasswd][2] command.
> - VPN status can be viewed via `occtl` command
> - You can edit the config file [/etc/ocserv/ocserv.conf][3], then restart service.

## up and running

```bash
$ docker-compose up -d
$ docker-compose exec ocserv sh
>>> cd /etc/ocserv/
>>> echo 'no-route = 1.2.3.4/32' >> /etc/ocserv/defaults/group.conf
>>> ocpasswd -c ocpasswd username
    Enter password: ******
    Re-enter password: ******
>>> exit
$ docker-compose restart
$ docker cp ocserv_ocserv_1:/etc/ocserv/certs/client.p12 .
$ docker cp ocserv_ocserv_1:/etc/ocserv/certs/server-cert.pem .
$ docker-compose logs -f
```

> You need to access your vpn server directly with `no-route`.

To remove the password protection of `client.p12`:

```bash
$ mv client.p12 client.p12.orig
$ openssl pkcs12 -in client.p12.orig -nodes -out tmp.pem
$ openssl pkcs12 -export -in tmp.pem -out client.p12 -passout pass:
$ rm tmp.pem
```

> :warning: Apple's Keychain Access will refuse to open it with no passphrase.

## mobile client

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
            File System: client.p12
```

> :question: Android client show warning dialog: `Certificate is not yet valid.` ([WHY?][4])

## desktop client

[download](https://www.cellsystech.com/software/anyconnect/)

`client.p12` and `server-cert.pem` can be imported into keychain.


[1]: http://www.infradead.org/ocserv/
[2]: http://www.gnutls.org/manual/html_node/certtool-Invocation.html
[3]: http://www.infradead.org/ocserv/manual.html
[4]: http://www.cisco.com/c/en/us/td/docs/security/vpn_client/anyconnect/anyconnect31/release/notes/anyconnect31rn.html
