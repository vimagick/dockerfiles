#
# Dockerfile for tldextract
#

FROM python:3.14-alpine
MAINTAINER EasyPi Software Foundation

WORKDIR /app

COPY app.py .

RUN pip install --no-cache-dir tldextract

EXPOSE 8000

CMD ["python", "app.py"]
