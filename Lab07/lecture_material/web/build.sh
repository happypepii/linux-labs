#!/bin/bash

set -ueo pipefail

echo "<p>Version:" >version.inc.html
git rev-parse --short HEAD >>version.inc.html 2>/dev/null
echo "</p>" >>version.inc.html

pandoc --template template.html -A version.inc.html index.md >index.html
pandoc --template template.html -A version.inc.html rules.md >rules.html
./table.py <score.csv | pandoc --template template.html --metadata title="Score" -A version.inc.html - >score.html
