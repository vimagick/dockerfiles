FROM ubuntu:14.04
MAINTAINER kev

RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs npm wget unzip

WORKDIR /tmp
RUN wget https://ghost.org/zip/ghost-latest.zip
RUN unzip ghost-latest.zip -d /ghost
RUN rm ghost-latest.zip

WORKDIR /ghost
RUN sed 's/127.0.0.1/0.0.0.0/' config.example.js > config.js
RUN npm install --production

VOLUMN /ghost/content/data/
EXPOSE 2368

CMD NODE_ENV=production npm start
