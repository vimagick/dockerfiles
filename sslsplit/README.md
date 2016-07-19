sslsplit
========

[SSLsplit][1] is a tool for man-in-the-middle attacks against SSL/TLS encrypted
network connections.

## docker-compose.yml

```yaml
sslsplit:
  image: vimagick/sslsplit
  command:
    -k keys/ca.key -c keys/ca.crt -P
    -l logs/connections.log -S logs
    tcp 0.0.0.0 8080
    ssl 0.0.0.0 8443
  net: host
  volumes:
    - ./data:/data
  working_dir: /data
  restart: unless-stopped
```

## Server Setup

```bash
$ mkdir -p data/{key,log}
$ openssl req -x509 -newkey rsa:2048 -nodes -keyout data/key/ca.key -out data/key/ca.crt -days 3650 -subj '/CN=EasyPi'
$ docker-compose up -d
```

```bash
# setup
sysctl -w net.ipv4.ip_forward=1
iptables -t nat -N SSLSPLIT
iptables -t nat -A SSLSPLIT -p tcp --dport 80 -j REDIRECT --to-ports 8080
iptables -t nat -A SSLSPLIT -p tcp --dport 443 -j REDIRECT --to-ports 8443

# enable
iptables -t nat -A PREROUTING -j SSLSPLIT

# disable
iptables -t nat -D PREROUTING -j SSLSPLIT
```

## Client Setup

```bash
sudo route change default 192.168.31.231
curl -k https://www.baidu.com/s?wd=hello+world
```

> ProTip: No warning dialog after importing `ca.crt` into system/browser.

## read more

- <https://blog.heckel.xyz/2013/08/04/use-sslsplit-to-transparently-sniff-tls-ssl-connections/>

[1]: <http://www.roe.ch/SSLsplit>
