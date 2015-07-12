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
worker_1 | 2015-07-12T16:07:26 [INFO] process: %s
worker_1 | [youtube] os6U77Hhm_s: Downloading webpage
worker_1 | [youtube] os6U77Hhm_s: Downloading video info webpage
worker_1 | [youtube] os6U77Hhm_s: Extracting video information
worker_1 | [youtube] os6U77Hhm_s: Downloading DASH manifest
worker_1 | [youtube] os6U77Hhm_s: Downloading DASH manifest
worker_1 | [download] Destination: Shia LaBeouf TED Talk-os6U77Hhm_s.mp4
[download] 100% of 11.03MiB in 00:0297MiB/s ETA 00:00known ETA
```

## client

```
$ redis-cli -h server -a 'secret-passwd'
server> lpush urls 'https://www.youtube.com/watch?v=os6U77Hhm_s'
server> quit

$ rsync -ahP user@server:fig/youtube/data ~/Movies/youtube
```
