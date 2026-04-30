#!/bin/bash

set -ueo pipefail

html_dir="${html_dir:-public}"
logger=":"
mkdir -p "$html_dir"

log_msg(){
	echo "$( date '+build.sh | %Y-%m-%d %H:%M:%S |' )" "$@" >&2
}
get_version() {
    git rev-parse --short HEAD 2>/dev/null || echo unknown
}
html_gen(){
	local input_file="$1"
	local base_name="${input_file%.md}"
    $logger "Processing $input_file -> $base_name.html"
	pandoc --template template.html -A "$html_dir/version.inc.html" "$input_file" >"$html_dir/$base_name.html"
}
test "${1:-none}" == "--verbose" && logger=log_msg


$logger "Reading current version..."
echo "<p>Version: $( get_version )</p>" >"$html_dir/version.inc.html"

html_gen index.md
html_gen rules.md
$logger "Generating score table from CSV..."
TABLE_CAPTION="Scoring table" ./table.py <score.csv | pandoc --template template.html --metadata title="Score" -A "$html_dir/version.inc.html" - >"$html_dir/score.html"

$logger "Copying assets..."
cp main.css "$html_dir/"

$logger "Build complete!"

