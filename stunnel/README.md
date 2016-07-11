stunnel
=======

[Stunnel][1] is a proxy designed to add TLS encryption functionality to
existing clients and servers without any changes in the programs' code.

### Overview

domain | ip:port      | country | services
-------| ------------ | ------- | ------------------------------
master | 1.2.3.4:4911 | Japan   | openvpn-server, stunnel-server
bridge | 5.6.7.8:1194 | China   | stunnel-client
N/A    | 192.168/16   | China   | openvpn-client

### docker-compose.yml

```yaml
# In Japan
master:
  image: vimagick/stunnel
  ports:
    - "4911:4911"
  environment:
    - CLIENT=no
    - SERVICE=openvpn
    - ACCEPT=0.0.0.0:4911
    - CONNECT=server:1194
  external_links:
    - openvpn_server_1:server
  restart: always

# In China
bridge:
  image: vimagick/stunnel
  ports:
    - "1194:1194"
  environment:
    - CLIENT=yes
    - SERVICE=openvpn
    - ACCEPT=0.0.0.0:1194
    - CONNECT=server:4911
  extra_hosts:
    - server:1.2.3.4
  restart: always
```

### Server Setup (Cloud)

```bash
# master server (Japan)
docker-compose up -d master
```

### Client Setup (Cloud)

```bash
# bridge server (China)
docker-compose up -d bridge
```

### Client Setup (Local)

File: /etc/stunnel/stunnel.conf

```ini
foreground = yes
client = yes

[openvpn]
accept = 127.0.0.1:1194
connect = 1.2.3.4:4911
```

> Pro Tip: Running stunnel locally is faster.

### OpenVPN Setup (Partial)

```ini
# For Cloud Setup
...
remote 5.6.7.8 1194 tcp
route 192.168.0.0 255.255.0.0 net_gateway
...
```

```ini
# For Local Setup
...
remote 127.0.0.1 1194 tcp
route 1.2.3.4 255.255.255.255 net_gateway
route 192.168.0.0 255.255.0.0 net_gateway
....
```

[1]: https://www.stunnel.org/index.html
