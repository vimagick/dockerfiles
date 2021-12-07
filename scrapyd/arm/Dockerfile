#
# Dockerfile for scrapyd-arm (python3)
#

FROM debian:bullseye
MAINTAINER EasyPi Software Foundation

ENV SCRAPY_VERSION=2.5.1
ENV SCRAPYD_VERSION=1.2.1
ENV SCRAPYD_CLIENT_VERSION=v1.2.0
ENV SCRAPYRT_VERSION=v0.12
ENV SPIDERMON_VERSION=1.15.2
ENV PILLOW_VERSION=8.4.0

RUN set -xe \
    && apt-get update \
    && apt-get install -y autoconf \
                          build-essential \
                          cargo \
                          curl \
                          git \
                          libffi-dev \
                          libssl-dev \
                          libtool \
                          libxml2 \
                          libxml2-dev \
                          libxslt1.1 \
                          libxslt1-dev \
                          python3 \
                          python3-dev \
                          python3-distutils \
                          tini \
                          vim-tiny \
    && apt-get install -y libtiff5 \
                          libtiff5-dev \
                          libfreetype6-dev \
                          libjpeg62-turbo \
                          libjpeg62-turbo-dev \
                          liblcms2-2 \
                          liblcms2-dev \
                          libwebp6 \
                          libwebp-dev \
                          zlib1g \
                          zlib1g-dev \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python3 \
    && pip install --no-cache-dir ipython \
                   git+https://github.com/scrapy/scrapy.git@$SCRAPY_VERSION \
                   git+https://github.com/scrapy/scrapyd.git@$SCRAPYD_VERSION \
                   git+https://github.com/scrapy/scrapyd-client.git@$SCRAPYD_CLIENT_VERSION \
                   git+https://github.com/scrapinghub/scrapy-splash.git \
                   git+https://github.com/scrapinghub/scrapyrt.git@$SCRAPYRT_VERSION \
                   git+https://github.com/scrapinghub/spidermon.git@$SPIDERMON_VERSION \
                   git+https://github.com/python-pillow/Pillow.git@$PILLOW_VERSION \
    && curl -sSL https://github.com/scrapy/scrapy/raw/master/extras/scrapy_bash_completion -o /etc/bash_completion.d/scrapy_bash_completion \
    && echo 'source /etc/bash_completion.d/scrapy_bash_completion' >> /root/.bashrc \
    && apt-get purge -y --auto-remove autoconf \
                                      build-essential \
                                      cargo \
                                      curl \
                                      libffi-dev \
                                      libssl-dev \
                                      libtool \
                                      libxml2-dev \
                                      libxslt1-dev \
                                      python3-dev \
    && apt-get purge -y --auto-remove libtiff5-dev \
                                      libfreetype6-dev \
                                      libjpeg62-turbo-dev \
                                      liblcms2-dev \
                                      libwebp-dev \
                                      zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

COPY ./scrapyd.conf /etc/scrapyd/
VOLUME /etc/scrapyd/ /var/lib/scrapyd/
EXPOSE 6800

ENTRYPOINT ["tini", "--"]
CMD ["scrapyd", "--pidfile="]
