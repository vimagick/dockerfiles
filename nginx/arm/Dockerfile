#
# Dockerfile for nginx-arm
#

FROM easypi/alpine-arm

MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache nginx \
    && mkdir -p /run/nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
