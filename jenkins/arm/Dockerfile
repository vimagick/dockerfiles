#
# Dockerfile for jenkins-arm
#

FROM easypi/alpine-arm:edge
MAINTAINER EasyPi Software Foundation

ENV JENKINS_HOME /var/jenkins_home

RUN set -xe \
    && apk add -U bash \
                  curl \
                  git \
                  openjdk7 \
                  openssh-client \
                  ttf-dejavu \
    && addgroup -g 1000 jenkins \
    && adduser -h $JENKINS_HOME -u 1000 -G jenkins -s /bin/bash -D jenkins \
    && mkdir -p /usr/share/jenkins \
    && cd /usr/share/jenkins \
    && wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war \
    && rm -rf /var/cache/apk/*

VOLUME $JENKINS_HOME
WORKDIR $JENKINS_HOME

USER jenkins

EXPOSE 8080

CMD ["java", "-Djava.awt.headless=true", "-jar", "/usr/share/jenkins/jenkins.war"]
