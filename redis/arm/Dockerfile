#
# Dockerfile for redis-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache redis

WORKDIR /data
VOLUME /data

EXPOSE 6379

ENTRYPOINT ["redis-server", "--protected-mode", "no"]
CMD [ \
  "--save", "900", "1", \
  "--save", "300", "10", \
  "--save", "60", "10000" \
]
