#!/bin/bash

set -euo pipefail

DEST_DIR="${BACKUP_DIR:-$HOME/backup}"
mkdir -p "$DEST_DIR"

FILE_NAME="$(date +%Y-%m-%d_%H-%M-%S)_$(realpath "$1" | tr '/' '~')"

FINAL_DEST="$DEST_DIR/$FILE_NAME"

cp -R "$1" "$FINAL_DEST" || exit 1
echo "$FINAL_DEST"
