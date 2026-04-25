#!/bin/bash

set -euo pipefail

# Print all lines containing a word (in English alphabet) which begins with capital letter and all other letters are lowercase. 
# Test that the word TeX will not be matched.
grep -E '([^A-Za-z]|^)[A-Z][a-z]*([^A-Za-z]|$)'
