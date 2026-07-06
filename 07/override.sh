#!/bin/bash

set -euo pipefail

test -f .NO_HEADER && exit 0
test -f HEADER && cat HEADER && exit 0
echo "Error: HEADER not found." >&2 && exit 1
