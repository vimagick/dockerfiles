OpenVPN over Obfsproxy
======================

## docker-compose.yml

```
obfsproxy:
  image: vimagick/obfsproxy:latest
  ports:
    - "4911:4911"
  links:
    - openvpn_server_1:openvpn
  environment:
    - PASSWORD=J23TNHPJPAOQJLTCPLFD4CQYVFY6MEVP
    - DEST_HOST=openvpn
    - DEST_PORT=1194
    - LISTEN_ADDR=0.0.0.0
    - LISTEN_PORT=4911
  restart: always
```

