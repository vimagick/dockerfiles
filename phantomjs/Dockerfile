#
# Dockerfile for building PhantomJS
#

FROM ubuntu:14.04
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y git build-essential g++ flex bison gperf ruby perl \
       libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
       libpng-dev libjpeg-dev python \
    && apt-get install -y libfontconfig1 libicu52 libjpeg8 \
    && git clone git://github.com/ariya/phantomjs.git \
    && cd phantomjs \
    && git checkout 2.0 \
    && echo y | ./build.sh 2>/dev/null 1>&2 \
    && install -v -s -m 755 bin/phantomjs /usr/local/bin/ \
    && cd .. \
    && rm -rf phantomjs \
    && apt-get remove -y git build-essential g++ flex bison gperf ruby perl \
       libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
       libpng-dev libjpeg-dev python \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

CMD ["/usr/local/bin/phantomjs"]
