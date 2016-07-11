#
# Dockerfile for openvpn-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache openvpn

VOLUME /etc/openvpn
WORKDIR /etc/openvpn

ENTRYPOINT ["openvpn"]
CMD ["--config", "openvpn.conf"]
