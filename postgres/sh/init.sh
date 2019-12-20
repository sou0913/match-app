#!/bin/bash
# set -eu

for dumpfile in $IMPORT_FROM_DIR/*.dump; do
  pg_restore -C -d $POSTGRES_DB $dumpfile
done
