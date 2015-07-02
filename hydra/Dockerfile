#
# Dockerfile for hydra
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U bash \
               build-base \
               curl \
               git \
               parallel \
    && echo 'will cite' | parallel --bibtex \
    && mkdir src \
        && cd src \
        && git clone https://github.com/vanhauser-thc/thc-hydra.git . \
        && ./configure --prefix=/usr \
        && make install \
        && cd .. \
        && rm -rf src \
    && apk del --purge build-base \
    && rm -rf /var/cache/apk/*

VOLUME /work
WORKDIR /work
CMD ["bash"]
