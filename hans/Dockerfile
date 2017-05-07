#
# Dockerfile for hans
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add --no-cache build-base curl libstdc++ linux-headers tar \
    && mkdir hans \
    && cd hans \
    && curl -sSL https://github.com/friedrich/hans/archive/v1.0.tar.gz | tar xz --strip 1 \
    && make \
    && mv hans /usr/bin/hans \
    && cd .. \
    && rm -rf hans \
    && apk del build-base curl linux-headers tar

ENV NETWORK 10.1.2.0
ENV PASSWORD password

CMD hans -f -s $NETWORK -p $PASSWORD
