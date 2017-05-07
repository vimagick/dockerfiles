#
# Dockerfile for pdnsd
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN apk add -U pdnsd \
    && rm -rf /var/cache/apk/*

EXPOSE 53/tcp 53/udp

CMD ["pdnsd"]
