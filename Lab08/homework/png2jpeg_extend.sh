#!/bin/bash

set -euo pipefail

# Convert all PNG files in the current directory to JPEG format
for file in *.png; do
    if [[ -f "$file" ]]; then
        # Get the base name without the extension
        base_name="${file%.png}"
        # Convert to JPEG using ImageMagick's convert command
        if [[ -f "${base_name}.jpg" ]]; then
            echo "Warning: ${base_name}.jpg already exists. Skipping ${file}." >&2
        else
            magick "$file" "${base_name}.jpg"
        fi
    fi
done