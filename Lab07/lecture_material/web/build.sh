#!/bin/bash

set -ueo pipefail

html_dir="public"

echo "<p>Version:" >version.inc.html
git rev-parse --short HEAD >>version.inc.html 2>/dev/null || echo "unkown" >>version.inc.html
echo "</p>" >>version.inc.html

pandoc --template template.html -A version.inc.html index.md >"$html_dir/index.html"
pandoc --template template.html -A version.inc.html rules.md >"$html_dir/rules.html"
./table.py <score.csv | pandoc --template template.html --metadata title="Score" -A version.inc.html - >"$html_dir/score.html"
cp main.css "$html_dir/"

