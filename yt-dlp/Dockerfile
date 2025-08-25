#
# Dockerfile for yt-dlp
#

FROM python:3-alpine
MAINTAINER EasyPi Software Foundation

ARG YT_DLP_VERSION=2025.08.22
ARG YT_DLP_URL=https://github.com/yt-dlp/yt-dlp/releases/download/${YT_DLP_VERSION}/yt-dlp_linux

RUN set -xe \
    && apk add --no-cache ca-certificates curl \
    && curl -sSL ${YT_DLP_URL} -o /usr/local/bin/yt-dlp \
    && chmod +x /usr/local/bin/yt-dlp \
    && yt-dlp --version

WORKDIR /data

ENTRYPOINT ["yt-dlp"]
CMD ["--help"]
