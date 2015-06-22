#
# Dockerfile for bro
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y curl \
    && curl -sSL http://download.opensuse.org/repositories/network:bro/Debian_8.0/Release.key | apt-key add - \
    && echo 'deb http://download.opensuse.org/repositories/network:/bro/Debian_8.0/ /' > /etc/apt/sources.list.d/bro.list \
    && apt-get update \
    && apt-get install -y bro \
    && rm -rf /var/lib/apt/lists/*
RUN echo 'export PATH=/opt/bro/bin:$PATH' >> /root/.bashrc

WORKDIR /opt/bro/logs

ENTRYPOINT bro -i
CMD ${DEVICE:-eth0}
