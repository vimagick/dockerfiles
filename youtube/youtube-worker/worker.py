#!/usr/bin/env python
#
# youtube_dl worker
#

import logging
import os
import redis
import youtube_dl


def download(url):

    with youtube_dl.YoutubeDL() as ydl:
        ydl.download([url])


if __name__ == '__main__':

    logging.basicConfig(format='%(asctime)s [%(levelname)s] %(message)s', datefmt='%FT%T', level='INFO')
    logging.info('connect redis')
    rdb = redis.StrictRedis(host='redis', password=os.getenv('PASSWORD'))
    rdb.ping()

    while True:
        try:
            _, url = rdb.brpop('urls')
            logging.info('process: %s', url)
            download(url)
        except Exception as ex:
            logging.error('error: %s', ex)

