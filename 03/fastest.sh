#!/bin/bash

# will sort the name too
# sort -n | cut -d , -f 1 | tail -n 1

# slower 
# sort -t ',' -k 2 | cut -d , -f 1 | head -n 1

sort -t ',' -n -k 2 | head -n 1 | cut -d , -f 1