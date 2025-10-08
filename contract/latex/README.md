# 📝 Contract Builder

Generate professional, parameterized contract PDFs using LaTeX and Make.

---

## ⚙️ Overview

This system lets you reuse a single `contract.tex` template with different party information, dates, and filenames — all managed through a `Makefile`.

It uses `xelatex` for Unicode-safe PDF output and supports on-the-fly variable injection (no manual editing of the `.tex` files needed).

---

## 📁 Structure

```
contracts/
├── contract.tex     # Main LaTeX contract template
├── data.tex         # Default variable definitions (\def\partyA{} etc.)
├── Makefile         # Build automation
└── README.md        # This file
```

You can add alternate data files:
```
data-acme-zenith.tex
data-ngc-oec.tex
```

---

## 🧱 Usage

### Default build
```bash
make
```
→ Generates `contract-NGC-OEC.pdf` (from `data.tex`)

---

### Custom parties
```bash
make PARTY_A="Acme Corp" PARTY_B="Zenith Global"
```
→ Output: `contract-Acme Corp-Zenith Global.pdf`

---

### Custom date
```bash
make DATE="October 15, 2025"
```

---

### Custom data file
```bash
make DATA=data-acme.tex PARTY_A="Acme" PARTY_B="Zenith"
```

---

### Custom output filename
```bash
make OUTFILE="AcmeZenith-Agreement.pdf"
```

---

### Cleanup
```bash
make clean        # remove temporary LaTeX files
make distclean    # remove all generated PDFs
```

---

## 🧩 Parameters

| Variable | Description | Default |
|-----------|--------------|----------|
| `PARTY_A` | Party A name | `NGC` |
| `PARTY_B` | Party B name | `OEC` |
| `DATE` | Effective date | current date |
| `DATA` | Path to variable file | `data.tex` |
| `OUTFILE` | Output PDF name | `contract-$(PARTY_A)-$(PARTY_B).pdf` |

All can be overridden via `make` command-line arguments.

---

## 🧠 Advanced: Dynamic Data

To generate `data.tex` automatically from a template:
```bash
sed "s/{{PARTY_A}}/$(PARTY_A)/g; s/{{PARTY_B}}/$(PARTY_B)/g; s/{{DATE}}/$(DATE)/g" data-template.tex > data-temp.tex
make DATA=data-temp.tex
```

---

## 🧰 Requirements

- [XeLaTeX](https://www.tug.org/xetex/) (included in TeX Live or MacTeX)
- GNU Make
- (Optional) `sed` for template substitution

---

## ✅ Example

```bash
make PARTY_A="Northern Garment Corp" PARTY_B="OEC Logistics" DATE="October 9, 2025"
```
→ Generates **`contract-Northern Garment Corp-OEC Logistics.pdf`**

---

## 🪶 Notes

- `contract.tex` automatically includes the first-page address and running header.
- Edit `\agreementShortTitle` inside `contract.tex` to control the short page header text.
- `data.tex` holds reusable definitions for each contract type.

---

*Maintained by [Your Name]*  
Version 1.0
