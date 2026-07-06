#!/bin/bash

set -ueo pipefail
USERNAME="info"
getnet passwd $USERNAME || echo "This is not NSWI177 disk" >&2