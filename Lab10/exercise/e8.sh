#!/bin/bash

set -euo pipefail

# Put every word (non-empty sequence of characters of the English alphabet) in parentheses.
sed -E 's:([A-Za-z]+):(\1):g'