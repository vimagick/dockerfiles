#
# Dockerfile for collectd
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U collectd \
    && rm -rf /var/cache/apk/*

COPY ./collectd /etc/collectd

CMD ["collectd", "-f", "-C", "/etc/collectd/collectd.conf"]
