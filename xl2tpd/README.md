xl2tpd
======

## docker-compose.yml

```yaml
xl2tpd:
  image: hwdsl2/ipsec-vpn-server
  ports:
    - "500:500"
    - "4500:4500"
  volumes:
    - /lib/modules:/lib/modules:ro
  environment:
    - VPN_IPSEC_PSK=foobar
    - VPN_USER=easypi
    - VPN_PASSWORD=123456
  privileged: yes
  restart: always
```

## up and running

```bash
$ docker-compose up -d
$ docker-compose logs
Attaching to xl2tpd_xl2tpd_1
xl2tpd_1  |
xl2tpd_1  | Trying to auto discover IP of this server...
xl2tpd_1  |
xl2tpd_1  | ================================================
xl2tpd_1  |
xl2tpd_1  | IPsec VPN server is now ready for use!
xl2tpd_1  |
xl2tpd_1  | Connect to your new VPN with these details:
xl2tpd_1  |
xl2tpd_1  | Server IP: x.x.x.x
xl2tpd_1  | IPsec PSK: foobar
xl2tpd_1  | Username: easypi
xl2tpd_1  | Password: 123456
xl2tpd_1  |
xl2tpd_1  | Write these down. You'll need them to connect!

$ docker-compose exec xl2tpd ipsec status
$ docker-compose exec xl2tpd ipsec whack --trafficstatus
```
