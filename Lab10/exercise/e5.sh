#!/bin/bash

set -euo pipefail

# Find all e-mail addresses. 
# Assume that a valid e-mail address has a format <s1>@<s2>.<s3>, where each sequence <sN> is a non-empty string of characters from English alphabet and sequences <s1> and <s2> may also contain digits or a dot ..
grep -Ei '[a-z0-9.]+@[a-z0-9.]+\.[a-z]+'