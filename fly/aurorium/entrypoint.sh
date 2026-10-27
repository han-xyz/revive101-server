#!/bin/sh
# Fly mounts the volume at /app/data owned by root.
set -eu
chown aurorium /app/data
exec setpriv --reuid=aurorium --regid=aurorium --clear-groups /app/aurorium "$@"
