# user variables
OUT_DIR = out
TMP_DIR = tmp

# .md to .html
PAGES = index rules score

# .csv --> script.py --> .html
PAGES_HTML = $(addprefix $(OUT_DIR)/, $(addsuffix .html, $(PAGES)))
PAGES_PDF  = $(OUT_DIR)/rules.pdf

all: $(PAGES_HTML) $(PAGES_PDF) $(OUT_DIR)/main.css

.PHONY: all clean upload

clean:
	rm -rf $(OUT_DIR)/* $(TMP_DIR)/*

upload: all
	rsync -avz $(OUT_DIR)/ jiangpe@u-pl0.ms.mff.cuni.cz:~/WWW/

# 1. gor index and rules (md -> html)
$(OUT_DIR)/%.html: %.md template.html | $(OUT_DIR)
	pandoc --template template.html -o $@ $<

# 2. for score (csv -> html)
$(OUT_DIR)/score.html:: score.csv table.py template.html | $(OUT_DIR)
	python3 table.py < score.csv | pandoc --template template.html --metadata title="Score" - > $@

# 3. CSS 
$(OUT_DIR)/main.css: main.css | $(OUT_DIR)
	cp $< $@

# 4. PDF
$(TMP_DIR)/rules.odt: rules.md | $(TMP_DIR)
	pandoc -o $@ $<

$(OUT_DIR)/rules.pdf: $(TMP_DIR)/rules.odt | $(OUT_DIR)
	soffice --headless --convert-to pdf $< --outdir $(OUT_DIR)

# 5.mkdir
$(OUT_DIR) $(TMP_DIR):
	mkdir -p $@