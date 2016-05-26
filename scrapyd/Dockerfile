#
# Dockerfile for scrapyd
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.info>

RUN set -xe \
    && apt-get update \
    && apt-get install -y autoconf \
                          build-essential \
                          curl \
                          git \
                          libffi-dev \
                          libssl-dev \
                          libtool \
                          python \
                          python-dev \
                          vim-tiny \
    && apt-get install -y libtiff5 \
                          libtiff5-dev \
                          libfreetype6-dev \
                          libjpeg62-turbo \
                          libjpeg62-turbo-dev \
                          liblcms2-2 \
                          liblcms2-dev \
                          libwebp5 \
                          libwebp-dev \
                          zlib1g \
                          zlib1g-dev \
    && mkdir libxml2 \
        && curl -sSL ftp://xmlsoft.org/libxml2/libxml2-2.9.2.tar.gz | tar xz --strip 1 -C libxml2 \
        && cd libxml2 \
        && ./configure --prefix=/usr \
        && make \
        && make install \
        && ldconfig \
        && cd .. \
        && rm -rf libxml2 \
    && mkdir libxslt \
        && curl -sSL https://git.gnome.org/browse/libxslt/snapshot/libxslt-1.1.28.tar.xz | tar xJ --strip 1 -C libxslt \
        && cd libxslt \
        && ./autogen.sh --prefix=/usr \
        && make \
        && make install \
        && ldconfig \
        && cd .. \
        && rm -rf libxslt \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && pip install git+https://github.com/scrapy/scrapy.git \
                   git+https://github.com/scrapy/scrapyd.git \
                   git+https://github.com/scrapy/scrapyd-client.git \
                   git+https://github.com/scrapinghub/scrapy-splash.git \
                   git+https://github.com/python-pillow/Pillow.git \
    && curl -sSL https://github.com/scrapy/scrapy/raw/master/extras/scrapy_bash_completion -o /etc/bash_completion.d/scrapy_bash_completion \
    && echo 'source /etc/bash_completion.d/scrapy_bash_completion' >> /root/.bashrc \
    && apt-get purge -y --auto-remove autoconf \
                                      build-essential \
                                      libffi-dev \
                                      libssl-dev \
                                      libtool \
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

CMD ["scrapyd"]
