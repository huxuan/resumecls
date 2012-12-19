# +-----------------------------------------------------------------------------
# | File: Makefile
# | Author: huxuan
# | E-mail: i(at)huxuan.org
# | Created: 2012-12-18
# | Last modified: 2012-12-19
# | Description:
# |     Makefile for resumecls
# |
# | Copyrgiht (c) 2012 by huxuan. All rights reserved.
# | License GPLv3
# +-----------------------------------------------------------------------------

include config.mk
EXAMPLE=example
EXAMPLEZH=example-zh
EXAMPLEEN=example-en

PACKAGE=resumecls
SOURCES=$(PACKAGE).ins $(PACKAGE).dtx
CLSFILES=$(PACKAGE).cls
BIBFILE=$(EXAMPLE).bib

.PHONY: all cls doc example-zh example-en clean distclean

all: doc example-zh example-en

# cls

cls: $(CLSFILES)

$(CLSFILES): $(SOURCES)
	latex $(PACKAGE).ins

# doc

doc: $(PACKAGE).pdf

$(PACKAGE).pdf: $(CLSFILES)
	xelatex $(PACKAGE).dtx
	makeindex -s gind.ist -o $(PACKAGE).ind $(PACKAGE).idx
	makeindex -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo
	xelatex $(PACKAGE).dtx
	xelatex $(PACKAGE).dtx

# example-zh

example-zh: $(EXAMPLEZH).pdf

$(EXAMPLEZH).pdf: $(CLSFILES) $(EXAMPLEZH).bbl
	xelatex $(EXAMPLEZH).tex
	xelatex $(EXAMPLEZH).tex

$(EXAMPLEZH).bbl: $(BIBFILE)
	xelatex $(EXAMPLEZH).tex
	-bibtex $(EXAMPLEZH)

# example-en

example-en: $(EXAMPLEEN).pdf

$(EXAMPLEEN).pdf: $(CLSFILES) $(EXAMPLEEN).bbl
	xelatex $(EXAMPLEEN).tex
	xelatex $(EXAMPLEEN).tex

$(EXAMPLEEN).bbl: $(BIBFILE)
	xelatex $(EXAMPLEEN).tex
	-bibtex $(EXAMPLEEN)

# dist & clean

clean:
	-@rm -f \
		*~ \
		*.aux \
		*.bbl \
		*.blg \
		*.dvi \
		*.glo \
		*.gls \
		*.idx \
		*.ilg \
		*.ind \
		*.log \
		*.out

distclean: clean
	-@rm -f \
		*.cls \
		*.pdf
