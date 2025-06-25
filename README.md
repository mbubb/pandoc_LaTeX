# pandoc and LaTeX

In a directory - a markdown file, a bib file and a Makefile. Also templates and cls files in a ~/.local/share/pandoc dir.

The einvogel template and the apa.cls file are for generating an APA7 research paper.




### install command (Debian like system)

```
    sudo apt install -y pandoc
    sudo apt install -y texlive-full
    sudo apt install -y   make   biber   pandoc-citeproc   fonts-noto   fonts-freefont-ttf   lmodern   ghostscript   wkhtmltopdf
```

### software versions

```
    pandoc --version
    pdflatex --version
    biber --version

    pandoc 3.1.11.1
    Features: -server +lua
    Scripting engine: Lua 5.4
    User data directory: /home/mbubb/.local/share/pandoc
    Copyright (C) 2006-2023 John MacFarlane. Web: https://pandoc.org
    This is free software; see the source for copying conditions. There is no
    warranty, not even for merchantability or fitness for a particular purpose.
    pdfTeX 3.141592653-2.6-1.40.26 (TeX Live 2025/dev/Debian)
    kpathsea version 6.4.0/dev
    Copyright 2024 Han The Thanh (pdfTeX) et al.
    There is NO warranty.  Redistribution of this software is
    covered by the terms of both the pdfTeX copyright and
    the Lesser GNU General Public License.
    For more information about these matters, see the file
    named COPYING and the pdfTeX source.
    Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
    Compiled with libpng 1.6.47; using libpng 1.6.48
    Compiled with zlib 1.3.1; using zlib 1.3.1
    Compiled with xpdf version 4.04
    biber version: 2.20
```

### websites used for templates and csl files

```
    https://pandoc-templates.org/
    https://github.com/Wandmalfarbe
    https://github.com/Wandmalfarbe/pandoc-latex-template
    https://www.zotero.org/styles/
```
