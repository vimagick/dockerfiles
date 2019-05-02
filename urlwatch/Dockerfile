#
# Dockerfile for urlwatch
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          build-base \
                          libffi-dev \
                          libxml2 \
                          libxml2-dev \
                          libxslt \
                          libxslt-dev \
                          openssl-dev \
                          python3 \
                          python3-dev \
    && python3 -m pip install appdirs \
                              cssselect \
                              keyring \
                              lxml \
                              minidb \
                              pyyaml \
                              requests \
    && apk del build-base \
               libffi-dev \
               libxml2-dev \
               libxslt-dev \
               openssl-dev \
               python3-dev \
    && echo '*/30 * * * * urlwatch' | crontab -

VOLUME /root/.urlwatch
WORKDIR /root/.urlwatch

CMD ["crond", "-f", "-L", "/dev/stdout"]
