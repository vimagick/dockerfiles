#
# Dockerfile for redis-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache redis

WORKDIR /data
VOLUME /data

EXPOSE 6379

ENTRYPOINT ["redis-server"]
CMD ["--protected-mode", "no"]
