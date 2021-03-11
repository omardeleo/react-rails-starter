#!/bin/bash
set -e

rm -f /srv/tmp/pids/server.pid

exec "$@"