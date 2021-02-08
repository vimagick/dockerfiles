#
# Dockerfile for icecast
#

FROM alpine:3

MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache icecast

EXPOSE 8000

CMD ["icecast", "-c", "/etc/icecast.xml"]
