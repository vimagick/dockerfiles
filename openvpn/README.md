openvpn
=======

[OpenVPN][1] is blocked in China. You need to connect vpn via secure tunnel.

Instead of using [fteproxy][2] as bridge, you can also use [stunnel][3].

- server: vpn.easypi.info
- bridge: bridge.easypi.info
- client: localhost

## docker-compose.yml (server)

```
data:
  image: busybox
  volumes:
    - /etc/openvpn

server:
  image: vimagick/openvpn
  expose:
    - "1194/tcp"
  volumes_from:
    - data
  cap_add:
    - NET_ADMIN
  restart: always

fteproxy:
  image: vimagick/fteproxy
  ports:
    - "4911:4911"
  links:
    - "server"
  environment:
    - "MODE=server"
    - "SERVER_IP=0.0.0.0"
    - "SERVER_PORT=4911"
    - "PROXY_IP=server"
    - "PROXY_PORT=1194"
    - "KEY=CB2FBA2BC70490526E749E01BB050F6B555964290DFF58CF24785B4A093F7B18"
  restart: always
```

## docker-compose.yml (bridge)

```
fteproxy:
  image: vimagick/fteproxy
  ports:
    - "1194:1194"
  environment:
    - "MODE=client"
    - "SERVER_IP=vpn.easypi.info"
    - "SERVER_PORT=4911"
    - "CLIENT_IP=0.0.0.0"
    - "CLIENT_PORT=1194"
    - "KEY=CB2FBA2BC70490526E749E01BB050F6B555964290DFF58CF24785B4A093F7B18"
  restart: always
```

## server

```
$ fig up -d data

$ ./setup.sh
1) server
2) client
3) revoke
4) backup
5) restore
6) quit

$ fig up -d
```

## bridge

```
$ fig up -d
```

## client

```
$ cat /etc/openvpn/client.conf
...
remote bridge.easypi.info 1194 tcp
route 192.168.1.0 255.255.255.0 net_gateway
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
