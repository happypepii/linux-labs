#!/bin/bash

set -ueo pipefail

test -f "$1" || exit 1
# stat -c %Y "$1" | date +"%Y-%m-%d" 

date -d "@$(stat -c %Y "$1")" +"%Y-%m-%d"
