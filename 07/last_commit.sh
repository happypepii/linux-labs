#!/bin/bash

set -ueo pipefail
git log --max-count=1 2>/dev/null || echo "Not inside a Git repository" >&2
