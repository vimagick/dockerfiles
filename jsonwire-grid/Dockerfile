#
# Dockerfile for jsonwire-grid
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ENV VERSION=0.5.0
ENV REPOSITORY=https://github.com/qa-dev/jsonwire-grid
ENV CONFIG_PATH=config.json

WORKDIR /etc/jsonwire-grid

RUN set -xe \
    && apk add --no-cache curl \
    && curl -sSL ${REPOSITORY}/releases/download/v${VERSION}/jsonwire-grid_${VERSION}_linux_amd64.tar.gz \
        | tar xz -C /usr/local/bin jsonwire-grid \
    && curl -sSLO ${REPOSITORY}/raw/master/config-local-sample.json \
    && curl -sSLO ${REPOSITORY}/raw/master/config-sample.json \
    && curl -sSLO ${REPOSITORY}/raw/master/config-test.json \
    && ln -s config-local-sample.json ${CONFIG_PATH} \
    && apk del curl

EXPOSE 4444

ENTRYPOINT ["jsonwire-grid"]
