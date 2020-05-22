#
# Dockerfile for cronicle
#

FROM node:alpine
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache curl tar \
    && curl -sSL https://raw.githubusercontent.com/jhuckaby/Cronicle/master/bin/install.js | node

WORKDIR /opt/cronicle
VOLUME /opt/cronicle/conf

ENV CRONICLE_foreground=1

EXPOSE 3012

ENTRYPOINT ["bin/control.sh"]
CMD ["start"]
