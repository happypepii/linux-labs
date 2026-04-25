#!/bin/bash

set -euo pipefail

# Find all lines in /etc/passwd that start with any of the letters A, B, C or D (case-insensitive).
grep -i "^[abcd]" /etc/passwd