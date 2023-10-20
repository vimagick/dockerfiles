#
# Dockerfile for n2n-arm
#

FROM debian:buster
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apt update \
    && apt install -y gnupg iptables lsb-release net-tools wget \
    && wget -qO- http://packages.ntop.org/apt/ntop.key | apt-key add - \
    && { \
           echo "deb http://apt.ntop.org/buster_pi armhf/"; \
           echo "deb http://apt.ntop.org/buster_pi all/"; \
       } > /etc/apt/sources.list.d/ntop.list \
    && apt update \
    && apt install -y n2n \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 5645/udp 7654/udp

ENTRYPOINT ["supernode"]
CMD ["-l", "7654"]
