#
# Dockerfile for building PhantomJS
#

FROM ubuntu:14.04
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y git build-essential g++ flex bison gperf ruby perl \
       libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
       libpng-dev libjpeg-dev python \
    && git clone git://github.com/ariya/phantomjs.git \
    && cd phantomjs \
    && git checkout 2.0 \
    && ./build.sh <<< y
