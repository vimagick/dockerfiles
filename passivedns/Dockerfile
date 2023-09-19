#
# Dockerfile for passivedns
#

FROM debian:12
MAINTAINER EasyPi Software Foundation

RUN set -xe \
 && apt update -y \
 && apt install -y autoconf \
                   automake \
                   build-essential \
                   curl \
                   libjansson-dev \
                   libjansson4 \
                   libldns-dev \
                   libldns3 \
                   libpcap-dev \
                   libpcap0.8 \
                   libssl-dev \
                   libssl3 \
 && mkdir -p /opt/passivedns \
 && cd /opt/passivedns \
 && curl -sSL https://github.com/gamelinux/passivedns/archive/refs/heads/master.tar.gz | tar xz --strip 1 \
 && autoreconf --install && ./configure --prefix=/usr && make install \
 && cp etc/default/passivedns-debian /etc/default/passivedns \
 && cp etc/init.d/passivedns-debian /etc/init.d/passivedns \
 && cp etc/logrotate.d/passivedns  /etc/logrotate.d/passivedns \
 && cd .. \
 && rm -rf /opt/passivedns \
 && apt remove -y autoconf \
                  automake \
                  build-essential \
                  curl \
                  libldns-dev \
                  libjansson-dev \
                  libpcap-dev \
                  libssl-dev \
 && rm -rf /var/lib/apt/lists/* \
 && passivedns -V

ENTRYPOINT ["passivedns"]
CMD ["-h"]
