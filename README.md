dockerfiles
===========

[![](https://travis-ci.org/vimagick/dockerfiles.svg)](https://travis-ci.org/vimagick/dockerfiles)

- :octocat: <https://github.com/vimagick/dockerfiles>
- :beetle: <https://github.com/vimagick/dockerfiles/issues>
- :book: <https://github.com/vimagick/dockerfiles/wiki>
- :whale: <https://hub.docker.com/u/vimagick/>

## TODO

- [ ] cloudtunes
- [ ] ffmpeg
- [ ] freegeoip
- [ ] gitolite
- [ ] hashcat
- [ ] irc
- [ ] plex
- [ ] sensu
- [ ] tshark

## DONE

- [x] alpine-arm :+1:
- [x] aria2 :+1:
- [x] audiowaveform
- [x] bro
- [x] casperjs :+1:
- [x] chinadns
- [x] collectd
- [x] dante
- [x] discuz :cn:
- [x] dnscrypt
    - [x] dnscrypt-proxy
    - [x] dnscrypt-wrapper
- [x] dokuwiki :+1:
- [x] ferm
- [x] ffserver :beetle:
- [x] fteproxy :+1:
- [x] fteproxy-arm :+1:
- [x] grafana
- [x] h2o
- [x] httpbin :+1:
- [x] hubot
- [x] hugo
- [x] hugo-arm
- [x] hydra
- [x] influxdb
- [x] iptables
- [x] joomla
- [x] mantisbt
- [x] monit
- [x] moodle :beetle:
- [x] mosquitto
- [x] motion-arm :+1:
- [x] nginad
- [x] nginx
- [x] ngrok :+1:
- [x] nodebb :+1:
- [x] node-red :+1:
- [x] node-red-arm :+1:
- [x] obfsproxy
- [x] opencart
- [x] openvpn :+1:
- [x] pdnsd
- [x] phantomjs
- [x] phpbb
- [x] piwik
- [x] polipo
- [x] pptpd
- [x] privoxy
- [x] proxyhub
- [x] pure-ftpd
- [x] redis-arm
- [x] revive
- [x] rsyncd
- [x] samba :beetle:
- [x] scrapyd :+1:
- [x] shadowsocks
    - [x] shadowsocks
    - [x] shadowsocks-libev :+1:
    - [x] shadowsocks-arm
    - [x] shadowsocks-libev-arm :+1:
- [x] shadowvpn
- [x] snort :beetle:
- [x] taskd
- [x] tinc :+1:
- [x] tmail :beetle:
- [x] tor
- [x] urlwatch :beetle:
- [x] webhook
- [x] webkit :beetle:
- [x] youtube :beetle:
    - [x] youtube-dl
    - [x] youtube-worker

## 3rd-party

- [x] centurylink/watchtower
- [x] drone/drone
- [x] ghost
- [x] gitlab/gitlab-ce
- [ ] gliderlabs/logspout
- [x] gliderlabs/registrator
- [ ] jenkins
- [x] letsencrypt
- [x] owncloud
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
