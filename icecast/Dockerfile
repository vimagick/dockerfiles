#
# Dockerfile for icecast
#

FROM alpine

MAINTAINER kev <noreply@easypi.pro>

RUN apk add --no-cache icecast

EXPOSE 8000

CMD ["icecast", "-c", "/etc/icecast.xml"]
