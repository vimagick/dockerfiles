shoutcast
=========

![](https://upload.wikimedia.org/wikipedia/en/thumb/f/f7/SHOUTcast_logo.svg/200px-SHOUTcast_logo.svg.png)

[SHOUTcast][1] Server (DNAS) - The most popular online streaming server
software on the planet, used by over 50,000 broadcasters.

## docker-compose.yml

```yaml
shoutcast:
  image: vimagick/shoutcast
  ports:
    - "8000:8000"
    - "8001:8001"
  volumes:
    - ./sc_serv.conf:/opt/shoutcast/sc_serv.conf
  restart: always
```

## sc_serv.conf

```ini
#
# http://wiki.shoutcast.com/wiki/SHOUTcast_DNAS_Server_2
#

adminpassword=hackme1
password=hackme2
requirestreamconfigs=1
streamid_1=1
streampath_1=/stream/1/
logfile=logs/sc_serv.log
w3clog=logs/sc_w3c.log
banfile=control/sc_serv.ban
ripfile=control/sc_serv.rip
```

[1]: http://wiki.shoutcast.com/wiki/SHOUTcast
