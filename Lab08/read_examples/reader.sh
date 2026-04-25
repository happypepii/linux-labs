#!/bin/sh

# set -ueo pipefail

read -r data_one <data.txt
read -r data_two <data.txt
read -r stdin_one
read -r stdin_two

echo "data_one=${data_one}"
echo "data_two=${data_two}"
echo "stdin_one=${stdin_one}"
echo "stdin_two=${stdin_two}"