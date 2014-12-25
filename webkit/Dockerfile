#
# Dockerfile for webkit
#

FROM ubuntu:14.04
MAINTAINER kev

RUN apt-get update && apt-get install -y supervisor haproxy libfontconfig1 libfreetype6
RUN mkdir -p /usr/local/lib/webkit/ /etc/supervisor/conf.d/ /etc/monit/ /var/lib/monit/events/

ADD ./*.js ./includes /usr/local/lib/webkit/
ADD ./bin/* /usr/local/bin/
ADD ./haproxy.cfg /etc/haproxy/
ADD ./supervisor/supervisord.conf /etc/supervisor/
ADD ./supervisor/conf.d/* /etc/supervisor/conf.d/
ADD ./monit/ /etc/monit/

EXPOSE 1024 2812 9001

CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf

