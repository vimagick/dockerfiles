#
# Dockerfile for haproxy-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache haproxy

CMD ["haproxy", "-f", "/etc/haproxy/haproxy.cfg"]
