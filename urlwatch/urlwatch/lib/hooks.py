#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# version detector for urlwatch
#

import lxml.html
import os.path
import re
import yaml


urlwatch_dir = os.path.expanduser(os.path.join('~', '.urlwatch'))
urls_txt = os.path.join(urlwatch_dir, 'urls.txt')
urls_yml = os.path.join(urlwatch_dir, 'urls.yml')
config = yaml.load(open(urls_yml))


def filter(url, data):

    for key, cfg in config.items():
        if url.endswith('#' + key):
            exp = cfg['exp']
            break
    else:
        return data

    try:
        dom = lxml.html.fromstring(data.encode('utf-8'))
        txt = dom.xpath(exp)[0]
        ver = re.search(r'([0-9]+\.)*[0-9]+', txt).group(0)
        return '{}: {}\n'.format(key, ver)
    except:
        return '{}: {}\n'.format(key, 'unknown')


if __name__ == '__main__':

    print 'Generating <urls.txt> ...',
    urls = ['{0[url]}#{1}\n'.format(cfg, key) for key, cfg in config.items()]
    with open(urls_txt, 'w') as f:
        f.writelines(urls)
    print 'OK!'

