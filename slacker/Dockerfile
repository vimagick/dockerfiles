#
# Dockerfile for slacker
#

FROM python:3.9-alpine
MAINTAINER EasyPi Software Foundation

RUN set -xe \
 && apk add --no-cache curl \
 && pip install --no-cache-dir aiosmtpd atpublic pyslack pyyaml requests \
 && cd /usr/local/lib/python3.9/site-packages/ \
 && wget https://github.com/ont/slacker/raw/master/handler.py

EXPOSE 8025
CMD ["aiosmtpd", "-n", "-l", "0.0.0.0:8025", "-c", "handler.MessageHandler"]
