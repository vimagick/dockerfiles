openHAB
=======

[openHAB][1] - a vendor and technology agnostic open source automation software
for your home. Build your smart home in no time!

## docker-compose.yml

```yaml
openhab:
  image: vimagick/openhab
  ports:
    - "8080:8080"
    - "8443:8443"
    - "5555:5555"
  restart: always
```

[1]: http://www.openhab.org/
