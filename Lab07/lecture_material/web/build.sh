#!/bin/bash

set -ueo pipefail

html_dir="${html_dir:-public}"
logger=":"

log_msg(){
	echo "$( date '+build.sh | %Y-%m-%d %H:%M:%S |' )" "$@" >&2
}
test "${1:-none}" == "--verbose" && logger=log_msg


$logger "Reading current version..."
echo "<p>Version: $(git rev-parse --short HEAD 2>/dev/null || echo unkown )</p>" >version.inc.html

$logger "Generating HTML ..."
pandoc --template template.html -A version.inc.html index.md >"$html_dir/index.html"
pandoc --template template.html -A version.inc.html rules.md >"$html_dir/rules.html"
TABLE_CAPTION="Scoring table" ./table.py <score.csv | pandoc --template template.html --metadata title="Score" -A version.inc.html - >"$html_dir/score.html"
cp main.css "$html_dir/"

