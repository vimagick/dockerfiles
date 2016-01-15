#!/bin/bash
set -e

export NODE_ENV=production
export silent=false
export daemon=false

if [[ "$*" == npm*start* ]]; then
    if [ ! -e "$BB_CONTENT/config.json" ]; then
        sed "s/SECRET/$(node -e 'console.log(require("node-uuid").v4())')/" \
            "$BB_SOURCE/config.example.json" > "$BB_CONTENT/config.json"
        npm install connect-redis
    fi

    ln -sf "$BB_CONTENT/config.json" "$BB_SOURCE/config.json"

    exec "$@"
fi

exec "$@"
