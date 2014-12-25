#
# Dockerfile for webkit/phantomjs
#

FROM ubuntu:14.04
MAINTAINER kev

RUN apt-get update && apt-get install -y supervisor haproxy libfontconfig1 libfreetype6
RUN mkdir -p /webkit/includes/ /etc/supervisor/conf.d/ /etc/monit/conf.d/ /var/lib/monit/events/

ADD ./*.js /webkit/
ADD ./includes/ /webkit/includes/
ADD ./bin/ /usr/local/bin/
ADD ./haproxy.cfg /etc/haproxy/
ADD ./supervisor/supervisord.conf /etc/supervisor/
ADD ./supervisor/conf.d/ /etc/supervisor/conf.d/
ADD ./monit/monitrc /etc/monit/
ADD ./monit/conf.d/ /etc/monit/conf.d/

RUN chmod 600 /etc/monit/monitrc

EXPOSE 1024 2812 9001

CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf

