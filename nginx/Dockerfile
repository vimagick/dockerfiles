#
# Dockerfile for nginx
#

FROM alpine
MAINTAINER kev <noreply@easypi.info>

RUN set -xe \
    && apk add -U nginx \
    && rm -rf /var/cache/apk/*

VOLUME /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
