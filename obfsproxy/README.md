OpenVPN over Obfsproxy
======================

Obfsproxy is a pluggable transport proxy written in python.  
We can transport OpenVPN over Obfsproxy, so that firewall cannot detect it.  

Obfsproxy provides several obfuscation method. I consider `scramblesuit` the best.  
I will update this image if there's better one.

To use the example bellow, you should run `kylemanna/openvpn` container first.  
Don't forget to edit `/etc/openvpn/openvpn.conf` to use `proto tcp`.

## docker-compose.yml

```
data:
  image: busybox:latest
  volumes:
    - /etc/openvpn

server:
  image: kylemanna/openvpn:latest
  ports:
    - "1194:1194/tcp"
  volumes_from:
    - data
  cap_add:
    - NET_ADMIN
  restart: always

obfsproxy:
  image: vimagick/obfsproxy:latest
  ports:
    - "4911:4911"
  links:
    - server:openvpn
  environment:
    - PASSWORD=J23TNHPJPAOQJLTCPLFD4CQYVFY6MEVP
    - DEST_HOST=openvpn
    - DEST_PORT=1194
    - LISTEN_ADDR=0.0.0.0
    - LISTEN_PORT=4911
  restart: always
```

To link a existing `openvpn` container, please use `external_links` instead of `links`.

```
obfsproxy:
  image: vimagick/obfsproxy:latest
  ports:
    - "4911:4911"
  external_links:
    - openvpn_server_1:openvpn
  environment:
    - PASSWORD=J23TNHPJPAOQJLTCPLFD4CQYVFY6MEVP
    - DEST_HOST=openvpn
    - DEST_PORT=1194
    - LISTEN_ADDR=0.0.0.0
    - LISTEN_PORT=4911
  restart: always
```

The default run mode is `server`. You can also run container in `client` mode:

```
obfsproxy:
  ...
  environment:
    - RUN_MODE=client
  ...
```

The password should be encoded by Base32 with fixed length.  
You can generate one via this command:

```
python -c 'import base64, os; print base64.b32encode(os.urandom(20))'
```
