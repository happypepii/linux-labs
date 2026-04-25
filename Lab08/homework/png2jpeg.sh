#!/bin/bash

set -euo pipefail

# Convert all PNG files in the current directory to JPEG format
for file in *.png; do
    if [[ -f "$file" ]]; then
        # Get the base name without the extension
        base_name="${file%.png}"
        # Convert to JPEG using ImageMagick's convert command
        magick "$file" "${base_name}.jpg"
    fi
done