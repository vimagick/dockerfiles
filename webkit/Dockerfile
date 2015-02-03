#
# Dockerfile for webkit/phantomjs
#

FROM ubuntu:14.04
MAINTAINER kev

RUN echo "Asia/Shanghai" > /etc/timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN apt-get update && apt-get install -y supervisor haproxy nginx libfontconfig1 libfreetype6 fontconfig libicu52
RUN mkdir -p /data/ /webkit/includes/

ADD ./*.js /webkit/
ADD ./includes/ /webkit/includes/
ADD ./bin/ /usr/local/bin/
ADD ./etc/supervisor/supervisord.conf /etc/supervisor/
ADD ./etc/supervisor/conf.d/ /etc/supervisor/conf.d/
ADD ./etc/haproxy.cfg /etc/haproxy/
ADD ./etc/nginx.cfg /etc/nginx/sites-enabled/default
ADD ./etc/monitrc /etc/
ADD ./fonts/ /usr/local/share/fonts/

RUN chmod 600 /etc/monitrc
RUN fc-cache -f -v

VOLUME /data/
EXPOSE 80 1024 2812 9001

CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf

