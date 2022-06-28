#
# Dockerfile for ices
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache ices
COPY data /etc/ices

CMD ["ices", "/etc/ices/ices.xml"]
