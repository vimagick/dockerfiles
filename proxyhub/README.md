ProxyHub
========

## About

- shadowsocks: A secure socks5 proxy, designed to protect your Internet traffic.
- haproxy: A free, very fast and reliable solution offering high availability,
  load balancing, and proxying for TCP and HTTP-based applications.
- dnscrypt: A protocol for securing communications between a client and a DNS resolver.
- pdnsd: A DNS server designed for local caching of DNS information.
- nginx: an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3,
  and IMAP protocols, as well as a load balancer, caching and SSL offload.

## Fig

    proxyhub:
      image: vimagick/proxyhub
      ports:
        - "1080:1080"
      restart: always

## Run

    fig up -d

## Test

    curl -x socks5h://localhost:1080 https://www.youtube.com

