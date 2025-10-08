# Variables
PANDOC := pandoc
TEMPLATE := eisvogel
CSL := apa.csl
BIB := references.bib

# Output name
BASENAME ?= paper
PDF := $(BASENAME).pdf
DOCX := $(BASENAME).docx
HTML := $(BASENAME).html

# Date stamp
DATE := $(shell date +%Y-%m-%d)

# List of input parts (edit as needed)
PARTS := 00-meta.yaml \
		01-introduction.md \
		02-biaganti.md \
		03-dixon.md \
		04-kim.md \
		05-packard.md \
		06-rogers.md \
		07-summary.md

# Targets
all: $(PDF) $(DOCX) $(HTML)

pdf: $(PDF)

docx: $(DOCX)

html: $(HTML)

$(PDF): $(PARTS) $(BIB)
	$(PANDOC) $(PARTS) \
	  --from markdown \
	  --template=$(TEMPLATE) \
	  --citeproc \
	  --bibliography=$(BIB) \
	  --csl=$(CSL) \
	  -M date="$(DATE)" \
	  --output $(PDF)

$(DOCX): $(PARTS) $(BIB)
	$(PANDOC) $(PARTS) \
	  --citeproc \
	  --bibliography=$(BIB) \
	  --csl=$(CSL) \
	  -M date="$(DATE)" \
	  --output $(DOCX)

$(HTML): $(PARTS) $(BIB)
	$(PANDOC) $(PARTS) \
	  --citeproc \
	  --bibliography=$(BIB) \
	  --csl=$(CSL) \
	  -M date="$(DATE)" \
	  --output $(HTML)

clean:
	rm -f $(PDF) $(DOCX) $(HTML)

.PHONY: all clean pdf docx html
