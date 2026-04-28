.PHONY: all clean

CARDS = A1 A2

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
