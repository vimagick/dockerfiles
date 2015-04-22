ProxyHub
========

## About

`ProxyHub` is powered by:

- `shadowsocks`: A secure socks5 proxy, designed to protect your Internet traffic.
- `haproxy`: A free, very fast and reliable solution offering high availability,
  load balancing, and proxying for TCP and HTTP-based applications.
- `dnscrypt`: A protocol for securing communications between a client and a DNS resolver.
- `pdnsd`: A DNS server designed for local caching of DNS information.
- `polipo`: A lightweight forwarding and caching web proxy server.
- `nginx`: An open source reverse proxy server for HTTP, HTTPS, SMTP, POP3,
  and IMAP protocols, as well as a load balancer, caching and SSL offload.

## Fig

    proxyhub:
      image: vimagick/proxyhub
      ports:
        - "1080:1080"
        - "8123:8123"
      restart: always

## Run

    fig up -d

## Test

    # socks5 proxy
    curl -x socks5h://localhost:1080 https://www.youtube.com

    # http(s) proxy
    curl -x http://localhost:8123 https://www.youtube.com

## Todo

- add proxy.pac via nginx
- add transparent socks5 proxy via redsocks

