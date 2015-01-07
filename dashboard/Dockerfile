FROM ubuntu:14.04

RUN apt-get update && apt-get install -y wget collectd nodejs supervisor
RUN wget https://raw.githubusercontent.com/bpaquet/collectd-influxdb-proxy/master/proxy.js -P /usr/local/bin
RUN wget http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb -P /tmp
RUN dpkg -i /tmp/influxdb_latest_amd64.deb

CMD supervisord -n
