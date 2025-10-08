PARTY_A ?= NGC
PARTY_B ?= OEC
DATE ?= $(shell date +"%Y%B%d")
DATA ?= data/data.tex
OUTBASE ?= contract-$(PARTY_A)-$(PARTY_B)_$(DATE)
OUTFILE ?= $(OUTBASE).pdf

LATEXMK = latexmk -xelatex -interaction=nonstopmode -halt-on-error

# Tiny wrapper that sets the data file and then inputs your main tex
BUILD_TEX := .build.tex

$(BUILD_TEX): contract.tex $(DATA)
	@echo "\\def\\datafile{$(DATA)}\\input{contract.tex}" > $(BUILD_TEX)

$(OUTFILE): $(BUILD_TEX) contract.tex $(DATA)
	@$(LATEXMK) -jobname="$(OUTBASE)" $(BUILD_TEX) \

clean:
	@echo "Cleaning auxiliary files..."
	@latexmk -c
	@rm -f $(BUILD_TEX)
	rm -f *.aux *.log *.out *.fls *.fdb_latexmk *.xdv *.pdf.fls *.pdf.log *.pdf.out *.pdf.fdb_latexmk *.pdf.xdv *.pdf.aux *.pdf.fdb_latexmk
	@echo "✅ Basic cleanup complete."

# Deep clean: also remove all generated PDFs and intermediate artifacts
deepclean: clean
	@echo "Removing generated PDFs..."
	rm -f *.pdf
	@echo "🧹 Deep clean complete."