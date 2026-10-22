#!/bin/sh
# Nightly compressed pg_dump into the "backups" volume; keeps BACKUP_KEEP_DAYS days.
set -eu
while true; do
  stamp=$(date -u +%Y%m%d-%H%M%S)
  if pg_dump --format=custom --file="/backups/zeno-$stamp.dump"; then
    echo "backup ok: zeno-$stamp.dump"
  else
    echo "backup FAILED at $stamp" >&2
  fi
  find /backups -name 'zeno-*.dump' -mtime "+${BACKUP_KEEP_DAYS:-14}" -delete
  sleep 86400
done
