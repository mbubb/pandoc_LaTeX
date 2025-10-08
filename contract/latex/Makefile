# Makefile for LaTeX contract generation

FILE ?= CommercialPartner_OEC.md
BASENAME := $(basename $(FILE))
OUT := $(BASENAME).pdf

pdf:
	pandoc 00-meta.yaml $(FILE) \
	--from markdown \
	--template=templates/contract.latex \
	--pdf-engine=xelatex \
	--output=$(OUT)

html:
	pandoc 00-meta.yaml $(FILE) -s -o $(BASENAME).html

clean:
	rm -f $(BASENAME).pdf $(BASENAME).html
	rm -f *.aux *.log *.out *.toc