#
# Dockerfile for squid
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN apk add --no-cache squid

EXPOSE 3128 3130

ENTRYPOINT ["/usr/sbin/squid", "-NYCd1"]
