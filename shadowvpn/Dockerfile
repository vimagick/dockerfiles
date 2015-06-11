#
# Dockerfile for ShadowVPN
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

WORKDIR /
RUN apt-get update
RUN apt-get install -y build-essential automake libtool debhelper gawk git
RUN git clone --recursive https://github.com/clowwindy/ShadowVPN.git

WORKDIR /ShadowVPN
RUN ./autogen.sh
RUN ./configure --enable-static --sysconfdir=/etc
RUN make install

CMD ["/bin/bash"]
