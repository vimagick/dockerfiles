#!/bin/bash
#
# DokuWiki backup/restore script
#
# WARNING: It will mount current directory as a volume.
#          Related files should be in current directory.
#

cd "$(dirname "${BASH_SOURCE[0]}")"

mkdir -p backups

ACTION=${1:?action is required}
FILENAME=${2:-dw-backup-$(date +%Y%m%d-%H%M%S).tar.gz}
CONTAINER=${3:-dokuwiki_dokuwiki_1}

do_help() {
    echo 'USAGE: ./admin.sh ACTION [FILENAME] [CONTAINER]'
}

do_backup() {
    echo "backup to $FILENAME"
    docker run --rm --volumes-from $CONTAINER -v `pwd`/backups:/backup alpine \
           tar czf /backup/$FILENAME /var/www/html
}

do_restore() {
    echo "restore from $FILENAME"
    docker run --rm --volumes-from $CONTAINER -v `pwd`/backups:/backup alpine \
           tar xzf /backup/$FILENAME -C /
}

main() {
    case "$ACTION" in
        backup)
            do_backup
            ;;
        restore)
            do_restore
            ;;
        *)
            do_help
            exit 1;
            ;;
    esac
}

main
