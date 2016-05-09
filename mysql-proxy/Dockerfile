#
# Dockerfile for mysql-proxy
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.info>

RUN set -xe \
    && apt-get update \
    && apt-get install -y mysql-proxy \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 4040

ENTRYPOINT ["mysql-proxy"]
CMD ["--help"]
