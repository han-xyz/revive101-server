#!/bin/sh
# Fly mounts the volume at /data owned by root and resets the root filesystem on every start.
set -eu
mkdir -p /data/db /data/spiraldb /data/logs /data/cache /data/ravendb-packages
chown "$APP_UID" /data /data/db /data/spiraldb /data/logs /data/cache /data/ravendb-packages
# Keeps the embedded RavenDB's NuGet package cache across starts.
rm -rf /app/RavenDBServer/Packages
ln -s /data/ravendb-packages /app/RavenDBServer/Packages
exec setpriv --reuid="$APP_UID" --regid="$APP_UID" --clear-groups dotnet Imlight.Director.dll "$@"
