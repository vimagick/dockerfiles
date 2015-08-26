#!/bin/bash
#
# dokuwiki backup script
#

docker run --rm --volumes-from dokuwiki_dokuwiki_1 -v `pwd`:/backup alpine \
       tar czf /backup/dw-backup-$(date +%Y%m%d-%H%M%S).tar.gz /var/www/html
