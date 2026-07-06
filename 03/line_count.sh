#!/bin/bash

# get from "total"
# wc -l *.txt |tr -s ' '| cut -d ' ' -f 2 | tail -n 1 

cat *.txt | wc -l