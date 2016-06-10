#
# Dockerfile for django-cms
#

FROM vimagick/python:2
MAINTAINER kev <noreply@easypi.info>

WORKDIR /app

RUN set -xe \
    && apk add -U py-pillow tzdata \
    && pip install djangocms-installer \
    && djangocms -q -l en --utc -f -p . mysite

EXPOSE 80

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
