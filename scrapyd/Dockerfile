#
# Dockerfile for scrapyd (python2) [deprecated]
#

FROM debian:buster
MAINTAINER EasyPi Software Foundation

ENV SCRAPY_VERSION=1.8.0
ENV SCRAPYD_VERSION=1.2.1
ENV SCRAPYRT_VERSION=0.11.0
ENV PILLOW_VERSION=6.2.2

RUN set -xe \
    && apt-get update \
    && apt-get install -y autoconf \
                          build-essential \
                          curl \
                          git \
                          libffi-dev \
                          libssl-dev \
                          libtool \
                          libxml2 \
                          libxml2-dev \
                          libxslt1.1 \
                          libxslt1-dev \
                          python \
                          python-dev \
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
    && curl -sSL https://bootstrap.pypa.io/pip/2.7/get-pip.py | python \
    && pip install --no-cache-dir git+https://github.com/scrapy/scrapy.git@$SCRAPY_VERSION \
                   git+https://github.com/scrapy/scrapyd.git@$SCRAPYD_VERSION \
                   git+https://github.com/scrapy/scrapyd-client.git \
                   git+https://github.com/scrapinghub/scrapy-splash.git \
                   git+https://github.com/scrapinghub/scrapyrt.git@$SCRAPYRT_VERSION \
                   git+https://github.com/python-pillow/Pillow.git@$PILLOW_VERSION \
    && curl -sSL https://github.com/scrapy/scrapy/raw/master/extras/scrapy_bash_completion -o /etc/bash_completion.d/scrapy_bash_completion \
    && echo 'source /etc/bash_completion.d/scrapy_bash_completion' >> /root/.bashrc \
    && apt-get purge -y --auto-remove autoconf \
                                      build-essential \
                                      curl \
                                      libffi-dev \
                                      libssl-dev \
                                      libtool \
                                      libxml2-dev \
                                      libxslt1-dev \
                                      python-dev \
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
