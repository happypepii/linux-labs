#!/bin/bash

set -ueo pipefail

should_generate() {
   test ! -f "${1%.md}.html" || test "$1" -nt "${1%.md}.html"
}
