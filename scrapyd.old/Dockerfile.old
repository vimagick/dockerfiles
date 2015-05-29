#
# Dockerfile for scrapyd
#
# References:
# - http://docs.docker.com/reference/builder/
# - http://doc.scrapy.org/en/latest/topics/ubuntu.html#topics-ubuntu
# - https://github.com/scrapy/scrapyd/blob/master/debian/scrapyd.upstart#L9-L11
# - http://pip.readthedocs.org/en/latest/installing.html
# - http://supervisord.org/index.html
#

FROM ubuntu:14.04
MAINTAINER kev <noreply@datageek.info>

ADD ./requirements.txt /tmp/

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 627220E7 \
    && echo 'deb http://archive.scrapy.org/ubuntu scrapy main' > /etc/apt/sources.list.d/scrapy.list \
    && apt-get update \
    && apt-get install -y git \
                          libpq-dev \
                          build-essential \
                          python-dev \
                          python-pip \
                          python-numpy \
                          python-txzmq \
                          scrapy-0.24 \
                          scrapyd \
                          supervisor \
    && pip install -r /tmp/requirements.txt \
    && apt-get remove -y build-essential \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

ADD ./001-scrapyd /etc/scrapyd/conf.d/
ADD ./scrapyd.conf /etc/supervisor/conf.d/

EXPOSE 6800 9001

CMD supervisord -n -c /etc/supervisor/supervisord.conf

