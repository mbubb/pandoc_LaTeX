# ===============================================
# Contract PDF Builder
# ===============================================

# Default variables (can be overridden on the command line)
PARTY_A ?= NGC
PARTY_B ?= OEC
DATE ?= $(shell date +"%Y%B%d")
DATA ?= data/data.tex
OUTBASE ?= contract-$(PARTY_A)-$(PARTY_B)_$(DATE)
OUTFILE ?= $(OUTBASE).pdf

LATEXMK = latexmk -xelatex -interaction=nonstopmode -halt-on-error
BUILD_TEX := .build.tex

# ===============================================
# Primary targets
# ===============================================

# Build the temporary wrapper file that loads data + contract
$(BUILD_TEX): contract.tex $(DATA)
	@echo "\\def\\datafile{$(DATA)}\\input{contract.tex}" > $(BUILD_TEX)

# Build the final PDF using latexmk
$(OUTFILE): $(BUILD_TEX) contract.tex $(DATA)
	@echo "📄 Building contract for $(PARTY_A) and $(PARTY_B) on $(DATE)..."
	@$(LATEXMK) -jobname="$(OUTBASE)" $(BUILD_TEX)
	@echo "✅ Done: $(OUTFILE)"

# Convenience alias: make (default) builds PDF
all: $(OUTFILE)

# ===============================================
# Cleaning rules
# ===============================================

clean:
	@echo "🧹 Cleaning auxiliary files..."
	@latexmk -c > /dev/null
	@rm -f $(BUILD_TEX)
	@rm -f *.aux *.log *.out *.fls *.fdb_latexmk *.xdv
	@echo "✅ Basic cleanup complete."

cleanall: clean
	@echo "🗑️  Removing generated PDFs..."
	@rm -f *.pdf
	@echo "✅ Deep clean complete."

# ===============================================
# Housekeeping
# ===============================================

# Declare phony targets (not actual files)
.PHONY: all clean cleanall
