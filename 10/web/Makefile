MD_PAGES = index rules
CSV_PAGES = score group-a group-b
BIN_PAGES = $(notdir $(basename $(wildcard src/*.bin)))

PAGES_HTML=$(addprefix out/, $(addsuffix .html, $(MD_PAGES) $(CSV_PAGES) $(BIN_PAGES)))

.PHONY: all clean spelling

# all: $(PAGES_HTML) out/rules.pdf out/main.css
all: $(PAGES_HTML) out/main.css

clean:
	rm -rf out/*.html out/*.css out/*.pdf tmp/

spelling:
	cat src/*.md | aspell list --lang=en --mode=markdown

$(addprefix out/, $(addsuffix .html, $(CSV_PAGES))): out/%.html: src/%.csv src/table.py src/template.html
	./src/table.py <$< | pandoc --template src/template.html >$@

$(addprefix out/, $(addsuffix .html, $(MD_PAGES))): out/%.html: src/%.md src/template.html
	pandoc --template src/template.html -o $@ $<

$(addprefix out/, $(addsuffix .html, $(BIN_PAGES))): out/%.html: src/%.bin
	./$< > $@

out/main.css: src/main.css
	cp src/main.css out/

out/rules.pdf: tmp/rules.odt
	soffice --headless --convert-to pdf tmp/rules.odt --outdir out/

tmp/rules.odt: src/rules.md
	mkdir -p tmp/
	pandoc -o tmp/rules.odt src/rules.md

