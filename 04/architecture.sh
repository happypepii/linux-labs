#!/bin/bash

set -ueo pipefail

print_sys_arch(){
    uname -m
}

print_sys_arch