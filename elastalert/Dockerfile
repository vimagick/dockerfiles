#
# Dockerfile for elastalert
#

FROM python:3.6-alpine

ENV ELASTALERT_VERSION=v0.2.1
ENV ELASTALERT_HOME=/opt/elastalert
ENV TZ=UTC

WORKDIR ${ELASTALERT_HOME}

RUN set -xe \
    && apk add --no-cache \
        bash \
        curl \
        libffi \
        libmagic \
        libssl1.1 \
        musl \
        tzdata \
    && apk add --no-cache -t .build-deps \
        build-base \
        libffi-dev \
        musl-dev \
        openssl-dev \
        python3-dev \
    && pip install elastalert==${ELASTALERT_VERSION} \
    && mkdir -p rules \
    && curl -sSL https://github.com/Yelp/elastalert/raw/${ELASTALERT_VERSION}/config.yaml.example > config.yaml \
    && apk del .build-deps

VOLUME ${ELASTALERT_HOME}

CMD ["elastalert", "--config", "config.yaml"]
