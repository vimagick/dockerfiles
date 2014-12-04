#
# Dockerfile for scrapy
#

FROM ubuntu:14.04
MAINTAINER kev

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 627220E7
RUN echo 'deb http://archive.scrapy.org/ubuntu scrapy main' >/etc/apt/sources.list.d/scrapy.list
RUN apt-get update && apt-get install -y scrapy-0.24 scrapyd

CMD bash
