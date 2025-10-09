# 🧾 Contract Builder — Automated LaTeX + Makefile Workflow

This project provides a fully automated way to generate **customized contract PDFs** from a single LaTeX template.  
It uses a Makefile to handle variable injection, data file management, cleanup, and consistent file naming.

---

## ⚙️ Overview

Each contract PDF is generated from:
- `contract.tex` — the main LaTeX template.
- `data/data.tex` — a file defining reusable LaTeX macros for names, titles, and addresses.
- Variables (Party A, Party B, Date, etc.) passed dynamically from the Makefile.

The Makefile uses **XeLaTeX** via **latexmk** to build a print-ready, cross-platform PDF with proper Unicode font handling and multi-pass reference resolution.

---

## 🧱 Basic Usage

To build the default contract:

```bash
make
```

This compiles `contract.tex` using `data/data.tex` and produces:

```
contract-NGC-OEC_2025October08.pdf
```

The filename includes both party names and the date for version tracking.

---

## ⚙️ Custom Parameters

You can override build variables at runtime — no need to modify the template.

### Example:

```bash
make PARTY_A="Acme Corp" PARTY_B="Zenith Global" DATE="2025October10"
```

or build from a specific data file:

```bash
make DATA=data/acme-zenith.tex
```

All configuration variables are defined at the top of the Makefile:

| Variable | Purpose | Default |
|-----------|----------|----------|
| `PARTY_A` | Party A’s name | `NGC` |
| `PARTY_B` | Party B’s name | `OEC` |
| `DATE` | Build date (used in filename) | current date |
| `DATA` | Path to the data file | `data/data.tex` |
| `OUTBASE` | Base output filename | `contract-$(PARTY_A)-$(PARTY_B)_$(DATE)` |

Combine variables as needed:

```bash
make PARTY_A="Northern Garment Corp" PARTY_B="OEC Logistics" DATA=data/ngc-oec.tex
```

---

## 🧹 Cleaning and Rebuilding

Clean up LaTeX auxiliary files while keeping PDFs:

```bash
make clean
```

Full cleanup (including generated PDFs):

```bash
make cleanall
```

---

## 🧩 How It Works

1. The Makefile creates a temporary `.build.tex` wrapper that defines the data file to load:  
   ```latex
   \def\datafile{data/data.tex}\input{contract.tex}
   ```

2. `latexmk` compiles it with XeLaTeX, automatically handling multiple passes for references and page numbers.

3. The final PDF is renamed based on your variable values for consistent file versioning.

Example output:
```
contract-Northern Garment Corp-OEC Logistics_2025October10.pdf
```

---

## 🧠 Notes & Best Practices

- Keep all custom `data.tex` files in the `/data` directory.
- Define consistent macros like `\def\partyAshort{NGC}` and `\def\partyBshort{OEC}`.
- Use `xelatex` (not `pdflatex`) for Unicode compatibility.
- The Makefile’s `.PHONY` clause ensures that `make clean` and `make all` always run even if files with those names exist.
- If you see `Undefined control sequence` errors, check for typos in macro names or missing definitions in `data.tex`.
- Run `make clean && make` after changing any macro names or TeX definitions.

---

## 🔍 Troubleshooting

If LaTeX reports:
```
! Undefined control sequence.
```
→ The macro (like `\partyAshort`) is missing in `data.tex`. Add the missing definition.

If you see:
```
Page X of ??
```
→ Run `make` again. LaTeX needs a second pass to resolve total page numbers.

If you get a partial PDF but an error at the end, check the log file:
```bash
grep -A3 "!" contract-*.log
```

---

## ✅ Requirements

- **XeLaTeX** (from TeX Live or MacTeX)
- **GNU Make**
- **latexmk** (included in most TeX distributions)
- (Optional) `sed` or `awk` for automated data generation

---

*Maintained by [Your Name or Organization]*  
Version 1.1 — October 2025
