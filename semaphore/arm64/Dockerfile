#
# Dockerfile for semaphore-arm64
#

FROM debian:bullseye
MAINTAINER EasyPi Software Foundation

ARG APP_VERSION=2.8.77
ARG APP_ARCH=arm64
ARG APP_FILE=semaphore_${APP_VERSION}_linux_${APP_ARCH}.deb
ARG APP_URL=https://github.com/ansible-semaphore/semaphore
ARG APP_PACKAGE_URL=${APP_URL}/releases/download/v${APP_VERSION}/${APP_FILE}
ARG APP_WRAPPER_URL=${APP_URL}/raw/v${APP_VERSION}/deployment/docker/common/semaphore-wrapper

RUN set -xe \
 && apt update \
 && apt install -y ansible netcat tini wget \
 && wget ${APP_PACKAGE_URL} -O ${APP_FILE} \
 && wget ${APP_WRAPPER_URL} -O /usr/bin/semaphore-wrapper \
 && chmod +x /usr/bin/semaphore-wrapper \
 && (dpkg -i ${APP_FILE} || apt -f install -y) \
 && rm -rf ${APP_FILE} /var/lib/apt/lists/*

EXPOSE 3000

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/usr/bin/semaphore-wrapper", "/usr/bin/semaphore", "--config", "/etc/semaphore/config.json"]
