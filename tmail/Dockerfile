#
# Dockerfile for tmail
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN apk add --update build-base \
                     python     \
                     python-dev \
                     openssl    \
    && wget -O- https://bootstrap.pypa.io/get-pip.py | python \
    && pip install --no-cache-dir twisted \
    && apk del --purge build-base \
                       python-dev \
                       openssl    \
    && rm -rf /var/cache/apk/*

ENV MAIL_NAME easypi.info
ENV MAIL_PATH /var/mail
ENV MAIL_USER admin
ENV MAIL_PASS admin
ENV MAIL_OPTS=

VOLUME /var/mail
EXPOSE 25 110

CMD twistd -n mail --smtp=tcp:25 \
                   --pop3=tcp:110 \
                   --maildirdbmdomain=$MAIL_NAME=$MAIL_PATH \
                   --user=$MAIL_USER=$MAIL_PASS \
                   --bounce-to-postmaster \
                   $MAIL_OPTS

