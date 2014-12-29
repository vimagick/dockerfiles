#
# Dockerfile for webkit/phantomjs
#

FROM ubuntu:14.04
MAINTAINER kev

RUN apt-get update && apt-get install -y supervisor haproxy libfontconfig1 libfreetype6 monit nginx
RUN mkdir -p /data/ /webkit/includes/

ADD ./*.js /webkit/
ADD ./includes/ /webkit/includes/
ADD ./bin/ /usr/local/bin/
ADD ./haproxy.cfg /etc/haproxy/
ADD ./supervisor/supervisord.conf /etc/supervisor/
ADD ./supervisor/conf.d/ /etc/supervisor/conf.d/
ADD ./monit/conf.d/ /etc/monit/conf.d/
ADD ./nginx.cfg /etc/nginx/sites-enabled/default

VOLUME /data/
EXPOSE 80 1024 2812 9001

CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf

