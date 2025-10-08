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
