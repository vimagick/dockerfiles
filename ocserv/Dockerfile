#
# Dockerfile for ocserv
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

ENV OCSERV_VERSION 0.11.3

RUN set -xe \
    && apt-get update \
    && apt-get install -y autogen \
                          build-essential \
                          curl \
                          gnutls-bin \
                          iptables \
                          less \
                          libdbus-1-3 \
                          libdbus-1-dev \
                          libev4 \
                          libev-dev \
                          libgnutlsxx28 \
                          libgnutls28-dev \
                          libhttp-parser2.1 \
                          libhttp-parser-dev \
                          libnl-route-3-200 \
                          libnl-route-3-dev \
                          libopts25 \
                          libopts25-dev \
                          libpam0g \
                          libpam0g-dev \
                          libpcl1 \
                          libpcl1-dev \
                          libprotobuf-c1 \
                          libprotobuf-c-dev \
                          libprotobuf9 \
                          libprotobuf-dev \
                          libprotoc9 \
                          libprotoc-dev \
                          libreadline6 \
                          libreadline-dev \
                          libseccomp2 \
                          libseccomp-dev \
                          libtalloc2 \
                          libtalloc-dev \
                          libwrap0 \
                          libwrap0-dev \
                          protobuf-c-compiler \
                          protobuf-compiler \
    && curl -sSL ftp://ftp.infradead.org/pub/ocserv/ocserv-$OCSERV_VERSION.tar.xz | tar xJ \
    && cd ocserv-$OCSERV_VERSION \
    && ./configure --prefix=/usr --sysconfdir=/etc --with-local-talloc \
    && make install \
    && mkdir -p /etc/ocserv/certs \
    && cp ./doc/sample.config /etc/ocserv/ocserv.conf \
    && cp ./doc/profile.xml /etc/ocserv/profile.xml \
    && sed -i -e 's@^#user-profile = /path/to/file.xml@#user-profile = /etc/ocserv/profile.xml@' \
              -e 's@../tests/@/etc/ocserv/certs/@' \
              -e 's@certs/ca.pem@certs/ca-cert.pem@' \
              -e 's@./sample.passwd@/etc/ocserv/ocpasswd@' \
              -e 's@^#enable-auth = "certificate"$@enable-auth = "certificate"@' \
              -e 's@^try-mtu-discovery = false$@try-mtu-discovery = true@' \
              -e 's@^dns =.*$@dns = 8.8.8.8@' \
              -e 's@^default-domain@#&@' \
              -e 's@^route@#&@' \
              /etc/ocserv/ocserv.conf \
    && cd .. \
    && apt-get purge --auto-remove -y autogen \
                                      build-essential \
                                      libdbus-1-dev \
                                      libev-dev \
                                      libgnutls28-dev \
                                      libhttp-parser-dev \
                                      libnl-route-3-dev \
                                      libopts25-dev \
                                      libpam0g-dev \
                                      libpcl1-dev \
                                      libprotobuf-c-dev \
                                      libprotobuf-dev \
                                      libprotoc-dev \
                                      libreadline-dev \
                                      libseccomp-dev \
                                      libtalloc-dev \
                                      libwrap0-dev \
                                      protobuf-c-compiler \
                                      protobuf-compiler \
    && rm -rf ocserv-$OCSERV_VERSION /var/lib/apt/lists/*

COPY init.sh /init.sh
COPY docker-entrypoint.sh /entrypoint.sh

VOLUME /etc/ocserv

ENV VPN_DOMAIN=vpn.easypi.info \
    VPN_NETWORK=10.20.30.0     \
    VPN_NETMASK=255.255.255.0  \
    LAN_NETWORK=192.168.0.0    \
    LAN_NETMASK=255.255.0.0    \
    VPN_USERNAME=username      \
    VPN_PASSWORD=password      \
    TERM=xterm

EXPOSE 443/tcp 443/udp

ENTRYPOINT ["/entrypoint.sh"]
