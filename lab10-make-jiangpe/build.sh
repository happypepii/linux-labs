#!/bin/sh

set -ueo pipefail

./templater.py src/A1-data.json < templates/left.tpl > temp/A1-left.pango
./templater.py src/A1-data.json < templates/right.tpl > temp/A1-right.pango
./templater.py src/A1-data.json < templates/title.tpl > temp/A1-title.pango

./card.sh out/A1.png A1 @temp/A1-title.pango src/A1-thumb.png @temp/A1-left.pango @temp/A1-right.pango
