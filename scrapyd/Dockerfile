#
# Dockerfile for scraypd
#
# References:
# - http://docs.docker.com/reference/builder/
# - http://doc.scrapy.org/en/latest/topics/ubuntu.html#topics-ubuntu
# - https://github.com/scrapy/scrapyd/blob/master/debian/scrapyd.upstart#L9-L11
# - http://pip.readthedocs.org/en/latest/installing.html
# - http://supervisord.org/index.html
#

FROM ubuntu:14.04
MAINTAINER kev

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 627220E7
RUN echo 'deb http://archive.scrapy.org/ubuntu scrapy main' >/etc/apt/sources.list.d/scrapy.list
RUN apt-get update &&\
    apt-get install -y\
        git\
        libpq-dev\
        build-essential\
        python-dev\
        python-pip\
        python-numpy\
        python-txzmq\
        scrapy-0.24\
        scrapyd &&\
    apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN mkdir /var/log/supervisor/

ADD ./001-scrapyd /etc/scrapyd/conf.d/
ADD ./requirements.txt /tmp/
ADD ./supervisord.conf /etc/supervisor/supervisord.conf

WORKDIR /tmp
RUN pip install -r requirements.txt

EXPOSE 6800 9001

CMD supervisord -c /etc/supervisor/supervisord.conf

