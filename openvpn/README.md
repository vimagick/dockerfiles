OpenVPN
=======

[OpenVPN][1] is blocked in China. You need to connect vpn via secure tunnel.

Instead of using [fteproxy][2] as bridge, you can also use [stunnel][3] or [kcptun][4].

- server: vpn.easypi.info
- bridge: bridge.easypi.info
- client: localhost

## docker-compose.yml (server)

```yaml
openvpn:
  image: kylemanna/openvpn
  ports:
    - "1194:1194"
  volumes:
    - ./data:/etc/openvpn
  cap_add:
    - NET_ADMIN
  restart: always

fteproxy:
  image: vimagick/fteproxy
  ports:
    - "4911:4911"
  links:
    - openvpn
  environment:
    - MODE=server
    - SERVER_IP=0.0.0.0
    - SERVER_PORT=4911
    - PROXY_IP=openvpn
    - PROXY_PORT=1194
    - KEY=CB2FBA2BC70490526E749E01BB050F6B555964290DFF58CF24785B4A093F7B18
  restart: always
```

## docker-compose.yml (bridge)

```yaml
fteproxy:
  image: vimagick/fteproxy
  ports:
    - "1194:1194"
  environment:
    - MODE=client
    - SERVER_IP=vpn.easypi.pro
    - SERVER_PORT=4911
    - CLIENT_IP=0.0.0.0
    - CLIENT_PORT=1194
    - KEY=CB2FBA2BC70490526E749E01BB050F6B555964290DFF58CF24785B4A093F7B18
  restart: always
```

## Server Setup

```bash
$ ./setup.sh
1) server ...... (Step 1)
2) client ...... (Step 2)
3) revoke
4) quit   ...... (Step 3)

$ docker-compose up -d
```

Some Advanced Config

```bash
$ cat ./data/openvpn.conf
...
### Push Configurations Below
push "route 114.114.114.114 255.255.255.255 net_gateway"
push "route 192.168.0.0 255.255.0.0 net_gateway"
push "route 172.16.0.0 255.240.0.0 net_gateway"
push "route 10.0.0.0 255.0.0.0 net_gateway"

$ docker-compose restart
```

## Bridge Setup

```bash
$ docker-compose up -d
```

## Client Setup

```bash
$ cat /etc/openvpn/client.conf
...
remote bridge.easypi.info 1194 tcp
route 192.168.0.0 255.255.0.0 net_gateway
route 172.16.0.0 255.240.0.0 net_gateway
route 10.0.0.0 255.0.0.0 net_gateway
...
$ systemctl start openvpn@client
$ systemctl enable openvpn@client
```

## References

- <https://community.openvpn.net/openvpn/wiki>
- <https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-ubuntu-16-04>

[1]: https://openvpn.net/index.php/open-source.html
[2]: https://github.com/vimagick/dockerfiles/tree/master/fteproxy
[3]: https://github.com/vimagick/dockerfiles/tree/master/stunnel
[4]: https://github.com/vimagick/dockerfiles/tree/master/kcptun
