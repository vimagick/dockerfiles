#
# Dockerfile for building docker-compose-arm
#

FROM arm32v7/debian:buster
MAINTAINER EasyPi Software Foundation

ENV DOCKER_COMPOSE_VERSION=1.29.0
ENV PYINSTALLER_VERSION=4.1

RUN set -xe \
    && apt-get update \
    && apt-get install -y build-essential \
                          curl \
                          libffi-dev \
                          libssl-dev \
                          python3-dev \
                          upx-ucl \
                          zlib1g-dev \
    && curl https://bootstrap.pypa.io/get-pip.py | python3 \
    && pip install --no-cache-dir docker-compose==$DOCKER_COMPOSE_VERSION \
                   pyinstaller==$PYINSTALLER_VERSION \
    && cd /usr/local/lib/python3.7/dist-packages \
    && mkdir -p bin \
    && curl -sSL https://github.com/docker/compose/raw/$DOCKER_COMPOSE_VERSION/docker-compose.spec > docker-compose.spec \
    && curl -sSL https://github.com/docker/compose/raw/$DOCKER_COMPOSE_VERSION/bin/docker-compose > bin/docker-compose \
    && touch compose/GITSHA \
    && pyinstaller docker-compose.spec \
    && cp docker-compose/dist/docker-compose /usr/local/bin/ \
    && docker-compose version

ENTRYPOINT ["docker-compose"]
CMD ["help"]
