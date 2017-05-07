#
# Dockerfile for ShadowVPN
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

RUN apt-get update \
    && apt-get install -y automake \
                          build-essential \
                          gawk \
                          git \
                          net-tools \
                          iptables \
                          libtool \
    && git clone --recursive https://github.com/clowwindy/ShadowVPN.git \
    && cd ShadowVPN \
    && ./autogen.sh \
    && ./configure --enable-static --sysconfdir=/etc \
    && make install \
    && cd .. \
    && rm -rf ShadowVPN \
    && apt-get purge -y --auto-remove automake \
                                      build-essential \
                                      gawk \
                                      git \
                                      libtool

EXPOSE 1123/udp
VOLUME /etc/shadowvpn

CMD shadowvpn -c /etc/shadowvpn/server.conf

