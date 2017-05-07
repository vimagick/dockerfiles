#
# Dockerfile for vnstat
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apt-get update \
    && apt-get install -y vnstat vnstati \
    && sed -i '/UseLogging/s/2/0/' /etc/vnstat.conf \
    && rm -rf /var/lib/apt/lists/*

VOLUME /var/lib/vnstat

CMD ["vnstatd", "-n"]
