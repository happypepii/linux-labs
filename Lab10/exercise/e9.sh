#!/bin/bash

set -euo pipefail

# Replace “Name Surname” by “Surname, N.”.
# sed -E 's:([A-Z][a-z]+) ([A-Z][a-z]+):\2, \1.:g'
# sed -E 's:([A-Z])[a-z]+ ([A-Z][a-z]+):\2, \1.:g'

sed -E 's:(.).* (.*):\2, \1.:'
