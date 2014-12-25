#
# Dockerfile for webkit
#

FROM ubuntu:14.04
MAINTAINER kev

RUN apt-get update && apt-get install -y supervisor haproxy libfontconfig1 libfreetype6
RUN mkdir -p /usr/local/lib/webkit/

ADD ./*.js ./includes/ /usr/local/lib/webkit/
ADD ./phantomjs /usr/local/bin/
ADD ./webkit.sh /usr/local/bin/
ADD ./restart.sh /usr/local/bin/
ADD ./haproxy.cfg /etc/haproxy/
ADD ./supervisor/supervisord.conf /etc/supervisor/
ADD ./supervisor/conf.d/haproxy.conf /etc/supervisor/conf.d/
ADD ./supervisor/conf.d/webkit.conf /etc/supervisor/conf.d/
ADD ./supervisor/conf.d/restart.conf /etc/supervisor/conf.d/

EXPOSE 1024 9001

CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf

