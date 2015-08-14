#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# version detector for urlwatch
#

import cssselect.xpath
import lxml.html
import os.path
import re
import yaml


urlwatch_dir = os.path.expanduser(os.path.join('~', '.urlwatch'))
urls_txt = os.path.join(urlwatch_dir, 'urls.txt')
urls_yml = os.path.join(urlwatch_dir, 'urls.yml')
config = yaml.load(open(urls_yml))
tr = cssselect.xpath.HTMLTranslator()


def filter(url, data):

    try:

        for key, cfg in config.items():
            if url.endswith('#' + key):
                if not url.startswith(cfg['url']):
                    raise Exception('url mismatch')
                if 'xpath' in cfg:
                    xpath = cfg['xpath']
                elif 'css' in cfg:
                    xpath = tr.css_to_xpath(cfg['css'])
                else:
                    raise Exception('xpath/css required')
                break
        else:
            return data

        dom = lxml.html.fromstring(data.encode('utf-8'))
        txt = dom.xpath(xpath)[0]
        ver = re.search(r'(?i)([0-9]+\.)*[0-9]+(-?(alpha|beta|rc)[0-9]+)?', txt).group(0).lower()
        return '{}: {}\n'.format(key, ver)

    except:

        return '{}: {}\n'.format(key, 'unknown')


if __name__ == '__main__':

    print 'Extract urls from <{}> ({})'.format(urls_yml, len(config))
    urls = ['{0[url]}#{1}\n'.format(cfg, key) for key, cfg in config.items()]

    print 'Write urls to <{}> ({})'.format(urls_txt, len(urls))
    with open(urls_txt, 'w') as f:
        f.writelines(urls)

    print 'Everything is OK!'

