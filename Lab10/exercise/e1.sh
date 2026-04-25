#!/bin/bash

set -euo pipefail

# Find all lines in /etc/passwd that contain the digit 9. 
grep 9 /etc/passwd