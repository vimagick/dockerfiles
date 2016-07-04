dockerfiles
===========

A collection of delicious docker recipes.

[![](https://travis-ci.org/vimagick/dockerfiles.svg)](https://travis-ci.org/vimagick/dockerfiles)

- :octocat: <https://github.com/vimagick/dockerfiles>
- :beetle: <https://github.com/vimagick/dockerfiles/issues>
- :book: <https://github.com/vimagick/dockerfiles/wiki>
- :whale: <https://hub.docker.com/u/vimagick/>

[![](https://www.vultr.com/media/badge_onwhite.png)](https://www.vultr.com/?ref=6821947)

## Todo

- [ ] caddy
- [ ] cloudtunes
- [ ] dsniff
- [ ] ettercap
- [ ] firehol
- [ ] freegeoip
- [ ] freelan
- [ ] freeradius
- [ ] gitbook
- [ ] gitolite
- [ ] hashcat
- [ ] imagemagick
- [ ] ipset
- [ ] irc
- [ ] libreswan
- [ ] mitmproxy
- [ ] nagios
- [ ] nfs
- [ ] openldap
- [ ] openswan
- [ ] pritunl
- [ ] pyinstaller
- [ ] rtmpdump
- [ ] sensu
- [ ] tinyproxy
- [ ] tshark
- [ ] youtube-upload
- [ ] xl2tpd

## Daemon

- [x] alpine-arm :+1:
- [x] aria2 :+1:
- [x] audiowaveform
- [x] btsync
- [x] cadvisor
- [x] casperjs :+1:
- [x] collectd
- [x] ffserver :beetle:
- [x] h2o
- [x] httpbin :+1:
- [x] hubot
- [x] influxdb
- [x] influxdb-arm
- [x] mariadb
- [x] mariadb-arm
- [x] minidlna
- [x] monit
- [x] moodle :beetle:
- [x] mosquitto
- [x] motion-arm :+1:
- [x] nginx
- [x] nullmailer
- [x] nullmailer-arm
- [x] openssh
- [x] phantomjs
- [x] plex :moneybag:
- [x] portia
- [x] pure-ftpd
- [x] red5-server
- [x] redis-arm
- [x] rsyncd
- [x] rtmp
- [x] samba :+1:
- [x] samba-arm :+1:
- [x] scrapyd :+1:
- [x] swarm-arm
- [x] taskd
- [x] telegraf
- [x] telegraf-arm
- [x] tmail :beetle:
- [x] urlwatch :beetle:
- [x] vnstat
- [x] vsftpd
- [x] webhook
- [x] webkit :beetle:
- [x] youtube-worker :beetle:

## Tool

- [x] ffmpeg
- [x] youtube-dl

## Web

- [x] discuz :cn:
- [x] django-cms
- [x] dokuwiki :+1:
- [x] dokuwiki-arm :+1:
- [x] gogs-arm :cn:
- [x] grafana
- [x] grafana-arm
- [x] hugo
- [x] hugo-arm
- [x] jamapi
- [x] jenkins-arm :beetle:
- [x] joomla
- [x] json-server
- [x] magento
- [x] mantisbt
- [x] netdata
- [x] nginad
- [x] nodebb :+1:
- [x] node-red :+1:
- [x] node-red-arm :+1:
- [x] opencart
- [x] openrefine
- [x] phpbb
- [x] phpmyadmin-arm
- [x] phpvirtualbox-arm
- [x] piwik
- [x] revive

## Security

- [x] bro
- [x] clamav
- [x] ferm
- [x] hydra
- [x] iptables
- [x] routersploit
- [x] snort :beetle:
- [x] webgoat

## Proxy

- [x] dante
- [x] delegated
- [x] fteproxy :+1:
- [x] fteproxy-arm :+1:
- [x] haproxy-arm
- [x] mysql-proxy
- [x] ngrok :+1:
- [x] obfsproxy
- [x] polipo
- [x] privoxy
- [x] privoxy-arm
- [x] proxyhub
- [x] shadowsocks
    - [x] shadowsocks
    - [x] shadowsocks-libev :+1:
    - [x] shadowsocks-arm
    - [x] shadowsocks-libev-arm :+1:
- [x] squid
- [x] tor

## VPN

- [x] ocserv :+1:
- [x] openconnect
- [x] openvpn :+1:
- [x] pptp
- [x] pptpd
- [x] shadowvpn
- [x] strongswan :+1:
- [x] tinc :+1:

## DNS

- [x] chinadns
- [x] dnscrypt
    - [x] dnscrypt-proxy
    - [x] dnscrypt-wrapper
- [x] dnsmasq
- [x] dnsmasq-arm
- [x] pdnsd

## 3rd-party

- [x] centurylink/watchtower
- [x] drone/drone
- [x] drupal
- [x] ghost
- [x] gitlab/gitlab-ce
- [ ] gliderlabs/logspout
- [x] gliderlabs/registrator
- [ ] glot
    - [ ] bash
    - [ ] python
- [x] gogs :cn:
- [x] haproxy
- [x] jazzdd/phpvirtualbox
- [x] jenkins
- [x] jupyter/notebook
- [x] letsencrypt
- [x] mongo
- [x] neo4j
- [x] owncloud
- [x] phpmyadmin
- [x] registry
- [x] rocket.chat
- [x] scrapinghub/splash
- [ ] selenium
    - [ ] hub
    - [ ] node-firefox
    - [x] standalone-firefox
- [x] tutum/builder

## auto-completion

```bash
#!/bin/bash
#
# handy auto-completion for docker-exec
#

enter() {
  local name=${1:?}
  docker exec -it $name sh -c 'exec $(command -v bash || command -v sh)'
}

__enter() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  for cid in $(docker ps -q)
  do
    local name=$(docker inspect -f '{{.Name}}' $cid)
    name=${name#/}
    if [[ $name = $cur* ]]
    then
      COMPREPLY+=("$name")
    fi
  done
}

complete -F __enter enter
```
