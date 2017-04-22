#
# Dockerfile for ices-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache ices
COPY data /etc/ices

CMD ["ices", "/etc/ices/ices.xml"]
