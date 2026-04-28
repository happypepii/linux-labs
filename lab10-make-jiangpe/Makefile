.PHONY: all clean

DATA_FILES = $(wildcard src/*-data.json)
CARDS = $(patsubst src/%-data.json,%,$(DATA_FILES))
TARGETS = $(addprefix out/, $(addsuffix .png, $(CARDS)))

all: $(TARGETS)

clean:
         rm -rf temp/* out/*

temp/%-left.pango: src/%-data.json templates/left.tpl ./template.py
        ./template.py $< < templates/left.tpl > $@

temp/%-right.pango: src/%-data.json templates/right.tpl ./template.py
        ./template.py $< < templates/right.tpl > $@

temp/%-title.pango: src/%-data.json templates/title.tpl ./template.py
        ./template.py $< < templates/title.tpl > $@

out/%.png: src/%-thumb.png temp/%-title.pango temp/%-left.pango temp/%-right.pango ./card.sh
        ./card.sh $@ $* @temp/$*-title.pango src/$*-thumb.png @temp/$*-left.pango @temp/$*-right.pango 
