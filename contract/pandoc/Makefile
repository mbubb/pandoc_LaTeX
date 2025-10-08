# Variables
PANDOC := pandoc
TEMPLATE := eisvogel
CSL := apa.csl

# Output name
BASENAME ?= contract
PDF := $(BASENAME).pdf
DOCX := $(BASENAME).docx
HTML := $(BASENAME).html

# Date stamp
DATE := $(shell date +%Y-%m-%d)

# List of input parts (edit as needed)
PARTS := 00-meta.yaml \
		01-header.md \
		02-body.md \
		03-sig.md 

# Targets
all: $(PDF) $(DOCX) $(HTML)

pdf: $(PDF)

docx: $(DOCX)

html: $(HTML)

$(PDF): $(PARTS)
	$(PANDOC) $(PARTS) \
	  --from markdown \
	  --template=$(TEMPLATE) \
	  --citeproc \
	  --csl=$(CSL) \
	  -M date="$(DATE)" \
	  --output $(PDF)

$(DOCX): $(PARTS)
	$(PANDOC) $(PARTS) \
	  --citeproc \
	  --csl=$(CSL) \
	  -M date="$(DATE)" \
	  --output $(DOCX)

$(HTML): $(PARTS)
	$(PANDOC) $(PARTS) \
	  --citeproc \
	  --csl=$(CSL) \
	  -M date="$(DATE)" \
	  --output $(HTML)

clean:
	rm -f $(PDF) $(DOCX) $(HTML)

.PHONY: all clean pdf docx html
