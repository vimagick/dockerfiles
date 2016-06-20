#
# Dockerfile for nginx-arm
#

FROM easypi/alpine-arm

MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
