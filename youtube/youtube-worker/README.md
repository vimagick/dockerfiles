youtube-worker
==============

youtube-worker = youtube-dl + redis

## docker-compose.yml

```
worker:
  image: vimagick/youtube-worker
  links:
    - redis
  volumes:
    - data:/data
  environment:
    - PASSWORD=secret-passwd
  restart: always

redis:
  image: redis
  command: redis-server --requirepass 'secret-passwd'
  ports:
    - "6379:6379"
  restart: always
```

## server

```
$ cd ~/fig/youtube/

$ docker-compose up -d

$ docker-compose logs
Attaching to youtube_worker_1
worker_1 | 2015-07-12T16:07:07 [INFO] connect redis
worker_1 | 2015-07-12T16:07:26 [INFO] process: os6U77Hhm_s
worker_1 | [youtube] os6U77Hhm_s: Downloading webpage
worker_1 | [youtube] os6U77Hhm_s: Downloading video info webpage
worker_1 | [youtube] os6U77Hhm_s: Extracting video information
worker_1 | [youtube] os6U77Hhm_s: Downloading DASH manifest
worker_1 | [youtube] os6U77Hhm_s: Downloading DASH manifest
worker_1 | [download] Destination: Shia LaBeouf TED Talk-os6U77Hhm_s.mp4
[download] 100% of 11.03MiB in 00:0297MiB/s ETA 00:00known ETA
worker_1 | 2015-07-12T16:07:28 [INFO] success: True
```

## client

```
$ redis-cli -h server -a 'secret-passwd'
server> lpush urls os6U77Hhm_s
server> keys *
1) "pending"
server> keys *
1) "running"
server> keys *
1) "finished"
server> quit

$ rsync -ahP user@server:fig/youtube/data
receiving file list ...
2 files to consider
drwxr-xr-x          74 2015/07/13 00:52:25 data
-rw-r--r--           0 2015/07/13 01:04:40 data/Shia LaBeouf TED Talk-os6U77Hhm_s.mp4

sent 16 bytes  received 116 bytes  29.33 bytes/sec
total size is 0  speedup is 0.00
```
