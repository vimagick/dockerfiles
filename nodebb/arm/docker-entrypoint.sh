#!/bin/bash
set -e

export NODE_ENV=production
export silent=false
export daemon=false

if [[ "$*" == npm*start* ]]; then
    if [ ! -e "$BB_CONTENT/config.json" ]; then
        if [ -e "$BB_SOURCE/config.json" ]; then
            cp "$BB_SOURCE/config.json" "$BB_CONTENT/config.json"
        fi
    fi

    if [ -e "$BB_CONTENT/config.json" ]; then
        ln -sf "$BB_CONTENT/config.json" "$BB_SOURCE/config.json"
        [ -d "$BB_SOURCE/node_modules/redis" ] || npm install redis
        [ -d "$BB_SOURCE/node_modules/connect-redis" ] || npm install connect-redis
    fi

    exec "$@"
fi

exec "$@"
