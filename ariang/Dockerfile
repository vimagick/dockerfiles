#
# Dockerfile for AriaNg
#

FROM nginx:alpine
MAINTAINER EasyPi Software Foundation

ARG ARIA_NG_VERSION=1.2.4
ARG ARIA_NG_URL=https://github.com/mayswind/AriaNg/releases/download/${ARIA_NG_VERSION}/AriaNg-${ARIA_NG_VERSION}.zip

RUN set -xe \
 && cd /usr/share/nginx/html \
 && rm -rf * \
 && curl -sSL ${ARIA_NG_URL} | busybox unzip -
