#!/bin/bash

set -euo pipefail

# Find all lines which contain an even number of characters.
grep -E -x "(..)*"