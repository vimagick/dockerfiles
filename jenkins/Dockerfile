#
# Dockerfile for jenkins
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

ENV JENKINS_HOME /var/jenkins_home

RUN set -xe \
    && apk add -U curl \
                  openjdk8 \
                  openssh-client \
                  ttf-dejavu \
    && adduser -h $JENKINS_HOME -u 1000 -s /bin/sh -D jenkins \
    && mkdir -p /usr/share/jenkins \
    && cd /usr/share/jenkins \
    && wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war \
    && rm -rf /var/cache/apk/*

VOLUME $JENKINS_HOME
WORKDIR $JENKINS_HOME

USER jenkins

EXPOSE 8080

CMD ["java", "-Djava.awt.headless=true", "-jar", "/usr/share/jenkins/jenkins.war"]
