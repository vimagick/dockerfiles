#
# Dockerfile for icecast-arm
#

FROM easypi/alpine-arm

MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache icecast

EXPOSE 8000

CMD ["icecast", "-c", "/etc/icecast.xml"]
