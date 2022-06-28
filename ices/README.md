ices
====

[IceS][1] is a source client for the Icecast streaming server. The purpose of this
client is to provide an audio stream to Icecast, so that one or more listeners
can access the stream. With this layout, the source client can be situated
remotely from the Icecast server.

How It Works
------------

```
                +-> (LAN) -> (icecast) -+
(in) -> (ices) -|                       |-> (out) -> (mpd) -> (file)
                +-> (WAN) -> (icecast) -+
```

docker-compose.yml
------------------

```yaml
version: "3.8"

services:

  ices:
    image: vimagick/ices
    volumes:
      - ./data:/etc/ices
    devices:
      - /dev/snd
    depends_on:
      - icecast
    restart: unless-stopped
  
  icecast:
    image: vimagick/icecast
    ports:
      - "8000:8000"
    restart: unless-stopped
```

ices.xml
--------

```xml
<?xml version="1.0"?>
<ices>
    <background>0</background>
    <loglevel>4</loglevel>
    <consolelog>1</consolelog>
    <pidfile>/var/run/ices.pid</pidfile>
    <stream>
        <metadata>
            <name>Example stream name</name>
            <genre>Example genre</genre>
            <description>A short description of your stream</description>
            <url>http://easypi.info</url>
        </metadata>
        <input>
            <module>alsa</module>
            <param name="rate">44100</param>
            <param name="channels">1</param>
            <param name="device">hw:1,0</param>
            <param name="metadata">1</param>
            <param name="metadatafilename">/etc/ices/ices.txt</param>
        </input>
        <instance>
            <hostname>icecast</hostname>
            <port>8000</port>
            <password>hackme</password>
            <mount>/live.ogg</mount>
            <encode>
                <quality>0</quality>
                <samplerate>44100</samplerate>
                <channels>1</channels>
            </encode>
        </instance>
    </stream>
</ices>
```

> You can setup multiple `instances` (e.g. LAN & WAN).

ices.txt
--------

```ini
artist=Various Artists
title=Untitled Song
```

Running
-------

```bash
$ arecord -l
**** List of CAPTURE Hardware Devices ****
card 1: Device [USB Audio Device], device 0: USB Audio [USB Audio]
  Subdevices: 0/1
  Subdevice #0: subdevice #0
$ alsamixer -c 1
$ docker-compose up -d
$ streamripper http://localhost:8000/live.ogg
$ vi data/ices.txt
$ docker-compose kill -s SIGUSR1
```

[1]: http://icecast.org/ices/
