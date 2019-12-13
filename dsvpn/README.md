dsvpn
=====

[DSVPN][1] is a Dead Simple VPN

![][2]

docker-compose.yml
------------------

```yaml
dsvpn:
  image: vimagick/dsvpn
  command: server vpn.key auto 1959
  ports:
    - "1959:1959"
  volumes:
    - ./data:/etc/dsvpn
  working_dir: /etc/dsvpn
  devices:
    - /dev/net/tun
  privileged: true
  restart: unless-stopped
```

server
------

```bash
$ mkdir -p data
$ dd if=/dev/urandom of=data/vpn.key count=1 bs=32
$ docker-compose up -d
$ docker-compose logs -f
```

client
------

```bash
$ sudo dsvpn vpn.key 1.2.3.4 1959
$ ifconfig tun0
$ ping 192.168.192.254
```

[1]: https://github.com/jedisct1/dsvpn
[2]: https://github.com/jedisct1/dsvpn/raw/master/logo.png
