#!/bin/bash
#
# run webkit instance
#

set -e
cd /usr/local/lib/webkit
exec phantomjs server.js "$@"

