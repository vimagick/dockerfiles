dnsmasq
=======

[Dnsmasq][1] is a Domain Name System forwarder and Dynamic Host Configuration
Protocol server for small computer networks, created as free software.

## docker-compose.yml

```yaml
dnsmasq:
  image: vimagick/dnsmasq
  ports:
    - "53:53/tcp"
    - "53:53/udp"
    - "67:67/udp"
  volumes:
    - ./dnsmasq.d:/etc/dnsmasq.d
  cap_add:
    - NET_ADMIN
  restart: always
```

[1]: http://www.thekelleys.org.uk/dnsmasq/doc.html
