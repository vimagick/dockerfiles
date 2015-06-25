#
# Dockerfile for tmail
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add --update build-base \
                     python     \
                     python-dev \
                     openssl    \
    && wget -O- https://bootstrap.pypa.io/get-pip.py | python \
    && pip install twisted \
    && apk del --purge build-base \
                       python-dev \
                       openssl    \
    && rm -rf /var/cache/apk/*

ENV MAIL_NAME datageek.info
ENV MAIL_PATH /var/mail
ENV MAIL_USER admin
ENV MAIL_PASS admin

VOLUME /var/mail
EXPOSE 25 110

CMD twistd -n mail --esmtp \
                   --smtp=tcp:25 \
                   --pop3=tcp:110 \
                   --maildirdbmdomain=$MAIL_NAME=$MAIL_PATH \
                   --user=$MAIL_USER=$MAIL_PASS \
                   --bounce-to-postmaster
