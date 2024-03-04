#
# Dockerfile for maltrail
#

FROM debian:12
MAINTAINER EasyPi Software Foundation

ARG MALTRAIL_VERSION=0.67
ARG MALTRAIL_URL=https://github.com/stamparm/maltrail/archive/refs/tags/${MALTRAIL_VERSION}.tar.gz

WORKDIR /opt/maltrail

RUN set -xe \
 && apt update -y \
 && apt install -y curl \
                   build-essential \
                   libpcap0.8 \
                   libpcap-dev \
                   procps \
                   python3 \
                   python3-dev \
                   python3-pip \
                   python-is-python3 \
                   schedtool \
 && pip install --break-system-packages pcapy-ng \
 && curl -sSL ${MALTRAIL_URL} | tar xz --strip 1 \
 && mkdir -p etc log var misc/custom \
 && mv maltrail.conf etc \
 && mv trails/custom/dprk.txt misc/custom \
 && chmod +x server.py sensor.py \
 && ./server.py --version \
 && ./sensor.py --version \
 && apt remove -y curl \
                  build-essential \
                  libpcap-dev \
                  python3-dev \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 8337/udp 8338/tcp

CMD ["./server.py", "-c", "etc/maltrail.conf"]
