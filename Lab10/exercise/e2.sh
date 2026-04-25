#!/bin/bash

set -euo pipefail

# Accounts with /sbin/nologin in /etc/passwd are generally system accounts not used by a human user. 
# Print the list of these accounts.

grep '/sbin/nologin' /etc/passwd | cut -d: -f1