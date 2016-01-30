#
# Dockerfile for jenkins
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

ENV JENKINS_HOME /var/jenkins_home

RUN set -xe \
    && apk add -U curl openjdk8 ttf-dejavu \
    && adduser -h $JENKINS_HOME -u 1000 -s /bin/sh -D jenkins \
    && mkdir -p /usr/share/jenkins \
    && curl -fL http://mirrors.jenkins-ci.org/war/latest/jenkins.war -o /usr/share/jenkins/jenkins.war \
    && rm -rf /var/cache/apk/*

VOLUME $JENKINS_HOME
WORKDIR $JENKINS_HOME

USER jenkins

EXPOSE 8080

CMD ["java", "-Djava.awt.headless=true", "-jar", "/usr/share/jenkins/jenkins.war"]
