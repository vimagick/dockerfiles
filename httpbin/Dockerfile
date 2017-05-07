#
# Dockerfile for httpbin
#

FROM vimagick/python:3
MAINTAINER kev <noreply@easypi.pro>

RUN pip install gunicorn httpbin

EXPOSE 80

CMD ["gunicorn", "--bind", "0.0.0.0:80", "httpbin:app"]
