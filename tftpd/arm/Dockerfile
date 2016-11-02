#
# Dockerfile for tftpd-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache tftp-hpa
VOLUME /tftpboot
EXPOSE 69/udp

ENTRYPOINT ["in.tftpd"]
CMD ["--verbose", "--foreground", "--secure", "--create", "--user", "root", "/tftpboot"]
