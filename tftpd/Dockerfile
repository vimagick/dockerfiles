#
# Dockerfile for tftpd
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache tftp-hpa

WORKDIR /data
VOLUME /data
EXPOSE 69/udp

ENTRYPOINT ["in.tftpd"]
CMD ["--verbose", "--foreground", "--secure", "--create", "--user", "root", "/data"]
