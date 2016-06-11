dockerfiles
===========

A collection of delicious docker recipes.

[![](https://travis-ci.org/vimagick/dockerfiles.svg)](https://travis-ci.org/vimagick/dockerfiles)

- :octocat: <https://github.com/vimagick/dockerfiles>
- :beetle: <https://github.com/vimagick/dockerfiles/issues>
- :book: <https://github.com/vimagick/dockerfiles/wiki>
- :whale: <https://hub.docker.com/u/vimagick/>

[![](https://www.vultr.com/media/badge_onwhite.png)](https://www.vultr.com/?ref=6821947)

## TODO

- [ ] cloudtunes
- [ ] ffmpeg
- [ ] freegeoip
- [ ] gitolite
- [ ] hashcat
- [ ] irc
- [ ] sensu
- [ ] tshark

## DONE

- [x] alpine-arm :+1:
- [x] aria2 :+1:
- [x] audiowaveform
- [x] bro
- [x] cadvisor
- [x] casperjs :+1:
- [x] chinadns
- [x] clamav
- [x] collectd
- [x] dante
- [x] delegated
- [x] discuz :cn:
- [x] django-cms
- [x] dnscrypt
    - [x] dnscrypt-proxy
    - [x] dnscrypt-wrapper
- [x] dokuwiki :+1:
- [x] dokuwiki-arm :+1:
- [x] ferm
- [x] ffserver :beetle:
- [x] fteproxy :+1:
- [x] fteproxy-arm :+1:
- [x] gogs-arm :cn:
- [x] grafana
- [x] grafana-arm
- [x] h2o
- [x] httpbin :+1:
- [x] hubot
- [x] hugo
- [x] hugo-arm
- [x] hydra
- [x] influxdb
- [x] influxdb-arm
- [x] iptables
- [x] jamapi
- [x] jenkins-arm :beetle:
- [x] joomla
- [x] json-server
- [x] mantisbt
- [x] mariadb
- [x] mariadb-arm
- [x] minidlna
- [x] monit
- [x] moodle :beetle:
- [x] mosquitto
- [x] motion-arm :+1:
- [x] mysql-proxy
- [x] nginad
- [x] nginx
- [x] ngrok :+1:
- [x] nodebb :+1:
- [x] node-red :+1:
- [x] node-red-arm :+1:
- [x] nullmailer
- [x] nullmailer-arm
- [x] obfsproxy
- [x] opencart
- [x] openrefine
- [x] openvpn :+1:
- [x] pdnsd
- [x] phantomjs
- [x] phpbb
- [x] phpmyadmin-arm
- [x] phpvirtualbox-arm
- [x] piwik
- [x] plex :moneybag:
- [x] polipo
- [x] portia
- [x] pptpd
- [x] privoxy
- [x] privoxy-arm
- [x] proxyhub
- [x] pure-ftpd
- [x] red5-server
- [x] redis-arm
- [x] revive
- [x] routersploit
- [x] rsyncd
- [x] rtmp
- [x] samba :+1:
- [x] samba-arm :+1:
- [x] scrapyd :+1:
- [x] shadowsocks
    - [x] shadowsocks
    - [x] shadowsocks-libev :+1:
    - [x] shadowsocks-arm
    - [x] shadowsocks-libev-arm :+1:
- [x] shadowvpn
- [x] snort :beetle:
- [x] squid
- [x] swarm-arm
- [x] taskd
- [x] telegraf
- [x] telegraf-arm
- [x] tinc :+1:
- [x] tmail :beetle:
- [x] tor
- [x] urlwatch :beetle:
- [x] vsftpd
- [x] webgoat
- [x] webhook
- [x] webkit :beetle:
- [x] youtube :beetle:
    - [x] youtube-dl
    - [x] youtube-worker

## 3rd-party

- [x] centurylink/watchtower
- [x] drone/drone
- [x] drupal
- [x] ghost
- [x] gitlab/gitlab-ce
- [ ] gliderlabs/logspout
- [x] gliderlabs/registrator
- [x] gogs :cn:
- [x] jazzdd/phpvirtualbox
- [x] jenkins
- [x] jupyter/notebook
- [x] letsencrypt
- [x] mongo
- [x] neo4j
- [x] owncloud
- [x] phpmyadmin
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
