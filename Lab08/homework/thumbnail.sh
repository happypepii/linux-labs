#!/bin/bash

set -euo pipefail


for file in "$@"; do
    if [ ! -f "$file" ]; then
        echo "Error: $file is not a valid file." >&2
        exit 1
    else
        local ext="${file##*.}"
        local base_name="${file%.*}"
        magick "$file" -resize 800x600 "${base_name}.thumb.${ext}"
    fi
done