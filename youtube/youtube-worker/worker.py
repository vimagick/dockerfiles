#!/usr/bin/env python
#
# youtube_dl worker
#

import logging
import os
import redis
import time
import youtube_dl


def download(url):

    def hook(info):

        time = int(time.time())
        status = info['status']

        if status == 'downloading':
            rdb.zadd('running', time, url)
        elif info['status'] == 'error':
            rdb.zrem('running', url)
            rdb.zadd('error', time, url)
        elif status == 'finished':
            rdb.zrem('running', url)
            rdb.zadd('finished', time, url)

    if rdb.zrank('finished', url) != None:
        return False

    opts = {
        'format': os.getenv('FORMAT', 'best'),
        'progress_hooks': [hook],
    }

    with youtube_dl.YoutubeDL(opts) as ydl:
        ydl.download([url])

    return True


if __name__ == '__main__':

    logging.basicConfig(format='%(asctime)s [%(levelname)s] %(message)s', datefmt='%FT%T', level='INFO')
    logging.info('connect redis')
    rdb = redis.StrictRedis(host='redis', db=os.getenv('DATABASE', 0),  password=os.getenv('PASSWORD'))
    rdb.ping()

    while True:
        try:
            _, url = rdb.brpop('pending')
            logging.info('process: %s', url)
            ok = download(url)
            logging.info('success: %s', ok)
        except Exception as ex:
            logging.error('error: %s', ex)

