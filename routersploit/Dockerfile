#
# Dockerfile for routersploit
#

FROM alpine
MAINTAINER EasyPi Software Foundation

WORKDIR /app

RUN set -xe \
    && apk add -U bash \
                  build-base \
                  curl \
                  libffi \
                  libffi-dev \
                  ncurses-dev \
                  python \
                  python-dev \
                  readline-dev \
                  tar \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && curl -sSL https://github.com/reverse-shell/routersploit/archive/master.tar.gz | tar xz --strip 1 \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del bash \
               build-base \
               curl \
               libffi-dev \
               ncurses-dev \
               python3-dev \
               readline-dev \
               tar \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["/app/rsf.py"]
