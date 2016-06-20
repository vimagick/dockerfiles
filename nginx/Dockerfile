#
# Dockerfile for nginx
#

FROM alpine

MAINTAINER kev <noreply@easypi.info>

RUN apk add --no-cache nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
