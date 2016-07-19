sslsplit
========

[SSLsplit][1] is a tool for man-in-the-middle attacks against SSL/TLS encrypted
network connections.

## docker-compose.yml

```yaml
sslsplit:
  image: vimagick/sslsplit
  command:
    -k key/ca.key -c key/ca.crt -P
    -l log/cnn.log -S log
    tcp 0.0.0.0 8080
    ssl 0.0.0.0 8443
  net: host
  volumes:
    - ./data:/data
  working_dir: /data
  restart: unless-stopped
```

## up and running

```bash
$ mkdir -p data/{key,log}
$ openssl req -x509 -newkey rsa:2048 -nodes -keyout data/key/ca.key -out data/key/ca.crt -days 365 -subj '/CN=EasyPi'
$ docker-compose up -d
```

```
sysctl -w net.ipv4.ip_forward=1
iptables -t nat -F
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080
iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-ports 8443
```

## read more

- <https://blog.heckel.xyz/2013/08/04/use-sslsplit-to-transparently-sniff-tls-ssl-connections/>

[1]: <http://www.roe.ch/SSLsplit>
