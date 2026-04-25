#!/bin/bash

set -euo pipefail

# Delete all empty lines.
sed -E 's/([.!?]) +([A-Z])/\1\n\2/g'