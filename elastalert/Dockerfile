#
# Dockerfile for elastalert
#

FROM python:3.6-alpine

ENV ELASTALERT_VERSION=v0.2.1
ENV ELASTALERT_HOME=/opt/elastalert

WORKDIR ${ELASTALERT_HOME}

RUN set -xe \
    && apk add --no-cache -t .build-deps \
        build-base \
        curl \
        libffi-dev \
        libmagic \
        musl-dev \
        openssl-dev \
        python-dev \
        tzdata \
    && pip install elastalert==${ELASTALERT_VERSION} \
    && mkdir -p rules \
    && curl -sSL https://github.com/Yelp/elastalert/raw/${ELASTALERT_VERSION}/config.yaml.example > config.yaml \
    && apk del .build-deps

VOLUME ${ELASTALERT_HOME}

CMD ["elastalert", "--config", "config.yaml"]
