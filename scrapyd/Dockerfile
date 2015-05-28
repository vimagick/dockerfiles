#
# Dockerfile for scrapyd
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

ADD ./scrapyd.conf /etc/scrapyd/
ADD ./requirements.txt /etc/scrapyd/

RUN apt-get update \
    && apt-get install -y autoconf \
                          build-essential \
                          curl \
                          libffi-dev \
                          libssl-dev \
                          libtool \
                          python \
                          python-dev \
                          vim-tiny \
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
    && pip install scrapy==0.24.6 scrapyd==1.0.1 \
    && pip install -r /etc/scrapyd/requirements.txt \
    && curl -sSL https://github.com/scrapy/scrapy/raw/master/extras/scrapy_bash_completion -o /etc/bash_completion.d/scrapy_bash_completion \
    && echo 'source /etc/bash_completion.d/scrapy_bash_completion' >> /root/.bashrc \
    && apt-get remove -y autoconf \
                         build-essential \
                         libffi-dev \
                         libssl-dev \
                         libtool \
                         python-dev \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

VOLUME /etc/scrapyd/ /var/lib/scrapyd/

EXPOSE 6800

CMD ["scrapyd"]
