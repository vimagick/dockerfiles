#
# Dockerfile for scrapy
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y build-essential \
                          curl \
                          libffi-dev \
                          libssl-dev \
                          libxml2-dev \
                          libxslt1-dev \
                          python \
                          python-dev \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && pip install scrapy==1.0.0rc1
    && apt-get remove -y build-essential \
                         libffi-dev \
                         libssl-dev \
                         libxml2-dev \
                         libxslt1-dev \
                         python-dev \
    && apt-get autoremove -y \
    && apt-get install -y libxml2 \
                          libxslt1.1 \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
