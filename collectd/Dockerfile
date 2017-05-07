#
# Dockerfile for collectd
#

FROM alpine

MAINTAINER kev <noreply@easypi.pro>

RUN apk add --no-cache collectd collectd-dev

COPY ./collectd /etc/collectd

VOLUME /etc/collectd

CMD ["collectd", "-f"]
