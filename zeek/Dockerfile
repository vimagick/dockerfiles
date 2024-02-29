#
# Dockerfile for bro
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

RUN apt-get update \
    && apt-get install -y curl \
    && curl -sSL http://download.opensuse.org/repositories/network:bro/Debian_8.0/Release.key | apt-key add - \
    && echo 'deb http://download.opensuse.org/repositories/network:/bro/Debian_8.0/ /' > /etc/apt/sources.list.d/bro.list \
    && apt-get update \
    && apt-get install -y bro \
    && rm -rf /var/lib/apt/lists/*
RUN echo 'export PATH=/opt/bro/bin:$PATH' >> /root/.bashrc

VOLUME /opt/bro/logs
WORKDIR /opt/bro/logs
ENV PATH /opt/bro/bin:$PATH

CMD ["bro", "--no-checksums", "--iface", "eth0"]
