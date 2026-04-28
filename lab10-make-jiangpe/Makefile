all: out/A1.png

temp/A1-left.pango: ./templater.py src/A1-data.json templates/left.tpl
	./templater.py src/A1-data.json < templates/left.tpl > temp/A1-left.pango

temp/A1-right.pango: ./templater.py src/A1-data.json templates/right.tpl
	./templater.py src/A1-data.json < templates/right.tpl > temp/A1-right.pango

temp/A1-title.pango: ./templater.py src/A1-data.json templates/title.tpl
	./templater.py src/A1-data.json < templates/title.tpl > temp/A1-title.pango

out/A1.png: ./card.sh temp/A1-title.pango src/A1-thumb.png temp/A1-left.pango temp/A1-right.pango
	./card.sh out/A1.png A1 @temp/A1-title.pango src/A1-thumb.png @temp/A1-left.pango @temp/A1-right.pango
