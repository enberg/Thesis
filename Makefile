DOCUMENT ?= SmartElement
WATCH_FILES ?= $(DOCUMENT).tex $(wildcard pages/*.tex) $(wildcard chapters/*.tex)
REFERENCES ?= references.bib

# Replace special chars
REPLACE := s/å/\\aa{}/g;s/Å/\\AA{}/g;s/ä/\\"{a}/g;s/Ä/\\"{A}/g;s/ö/\\"{o}/g;s/Ö/\\"{O}/g;s/\([^\]\)&/\1\\\&/g
REPLACE_QUOTED := s/é/\\\'{e}/g

# Default to a fast pdf compilation
all: document bibtex document document

# Make document
document: $(DOCUMENT).tex
	@pdflatex -synctex=1 -interaction=nonstopmode $<

# Generate bibliography
bibtex: $(DOCUMENT).aux
	@bibtex $<
