# From  https://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project
# -----------------------------------------------------------------------------
# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: clean

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
# Output name
BASENAME ?= contract
PDF := $(BASENAME).pdf
DOCX := $(BASENAME).docx
HTML := $(BASENAME).html

all: contract
contract: ${BASENAME}.pdf


# MAIN PDFLATEX RULE

contract: ${BASENAME}.tex bibliography.bib apa7.cls
	pdflatex ${BASENAME}
	biber ${BASENAME}
	pdflatex ${BASENAME}
	pdflatex ${BASENAME}

clean:
	@rm -f *.bbl
	@rm -f *.run.xml
	@rm -f *.aux
	@rm -f *.log
	@rm -f *.out
	@rm -f ${BASENAME}.pdf
	@rm -f *.bcf
	@rm -f *.blg
	@rm -f *.fff
	@rm -f *.ttt


# Makefile for contract PDF build
SECTIONS = 01-header.md 02-body.md 03-sig.md
DATA = data/OEC.yaml
OUT = contract.pdf

pdf:
	pandoc 00-meta.yaml $(DATA) $(SECTIONS) \
	--from markdown \
	--template=templates/contract.latex \
	--pdf-engine=xelatex \
	--output=$(OUT)

clean:
	rm -f $(OUT)
