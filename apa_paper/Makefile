#
# assuming a directory with a bib file and a markdown file like this:
# ─$ ls
# Makefile  references.bib  zerg.md
#
#run make commands like this: 
# make all BASENAME=zerg
#
# Variables
PANDOC := pandoc
MD := paper.md
BIB := references.bib
TEMPLATE := eisvogel
CSL := apa

BASENAME ?= paper

MD := $(BASENAME).md
PDF := $(BASENAME).pdf
DOCX := $(BASENAME).docx
HTML := $(BASENAME).html

DATE := $(shell date +%Y-%m-%d)

all: $(PDF) $(DOCX) $(HTML)

pdf: $(PDF) 

docx: $(DOCX) 

$(PDF): $(MD) $(BIB)
	$(PANDOC) $(MD) \
	  --from markdown \
	  --template=$(TEMPLATE) \
	  --citeproc \
	  --bibliography=$(BIB) \
	  --csl=$(CSL) \
	  -M date="$(DATE)" \
	  --output $(PDF)

$(DOCX): $(MD) $(BIB)
	$(PANDOC) $(MD) \
	  --citeproc \
	  --bibliography=$(BIB) \
	  --csl=$(CSL) \
	  -M date="$(DATE)" \
	  --output $(DOCX)

$(HTML): $(MD) $(BIB)
	$(PANDOC) $(MD) \
	  --citeproc \
	  --bibliography=$(BIB) \
	  --csl=$(CSL) \
	  -M date="$(DATE)" \
	  --output $(HTML)

clean:
	rm -f $(PDF) $(DOCX) $(HTML)

.PHONY: all clean pdf docx