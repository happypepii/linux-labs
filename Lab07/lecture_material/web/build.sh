#!/bin/bash

set -ueo pipefail

html_dir="public"
verbose=false

test "${1:-none}" == "--verbose" && verbose=true

$verbose && echo "Reading current version..." >&2
echo "<p>Version:" >version.inc.html
git rev-parse --short HEAD >>version.inc.html 2>/dev/null || echo "unkown" >>version.inc.html
echo "</p>" >>version.inc.html

$verbose && echo "Generating HTML ..." >&2
pandoc --template template.html -A version.inc.html index.md >"$html_dir/index.html"
pandoc --template template.html -A version.inc.html rules.md >"$html_dir/rules.html"
TABLE_CAPTION="Scoring table" ./table.py <score.csv | pandoc --template template.html --metadata title="Score" -A version.inc.html - >"$html_dir/score.html"
cp main.css "$html_dir/"

