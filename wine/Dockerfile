#
# Dockerfile for wine
#

FROM jess/wine
MAINTAINER kev <noreplay@datageek.info>

ADD Songti.ttc /usr/share/fonts/

RUN apt-get update
RUN apt-get install -y locales libfontconfig1 libfreetype6 fontconfig libicu52
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
RUN echo 'zh_CN.UTF-8 UTF-8' >> /etc/locale.gen
RUN locale-gen
RUN fc-cache -v -f
RUN useradd -m -s /bin/bash wine

ENV HOME /home/wine
ENV LANG en_US.UTF-8

USER wine
VOLUME $HOME
WORKDIR $HOME

CMD ["bash"]
