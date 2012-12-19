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

.PHONY: all cls doc example-zh example-en resume-zh resume-en clean distclean

all: doc example-zh example-en

# cls

cls: $(PACKAGE).cls

$(PACKAGE).cls: $(PACKAGE).ins $(PACKAGE).dtx
	latex $(PACKAGE).ins

# doc

doc: $(PACKAGE).pdf

$(PACKAGE).pdf: $(PACKAGE).cls
	xelatex $(PACKAGE).dtx
	makeindex -s gind.ist -o $(PACKAGE).ind $(PACKAGE).idx
	makeindex -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo
	xelatex $(PACKAGE).dtx
	xelatex $(PACKAGE).dtx

# example-zh

example-zh: $(EXAMPLEZH).pdf

$(EXAMPLEZH).pdf: $(PACKAGE).cls $(EXAMPLEZH).tex $(EXAMPLEZH).bbl
	xelatex $(EXAMPLEZH).tex
	xelatex $(EXAMPLEZH).tex

$(EXAMPLEZH).bbl: $(EXAMPLE).bib
	xelatex $(EXAMPLEZH).tex
	-bibtex $(EXAMPLEZH)

# example-en

example-en: $(EXAMPLEEN).pdf

$(EXAMPLEEN).pdf: $(PACKAGE).cls $(EXAMPLEEN).tex $(EXAMPLEEN).bbl
	xelatex $(EXAMPLEEN).tex
	xelatex $(EXAMPLEEN).tex

$(EXAMPLEEN).bbl: $(EXAMPLE).bib
	xelatex $(EXAMPLEEN).tex
	-bibtex $(EXAMPLEEN)

# resume-zh

resume-zh: $(RESUMEZH).pdf

$(RESUMEZH).pdf: $(PACKAGE).cls $(RESUMEZH).tex $(RESUMEZH).bbl
	xelatex $(RESUMEZH).tex
	xelatex $(RESUMEZH).tex

$(RESUMEZH).bbl: $(EXAMPLE).bib
	xelatex $(RESUMEZH).tex
	-bibtex $(RESUMEZH)

# resume-en

resume-en: $(RESUMEEN).pdf

$(RESUMEEN).pdf: $(PACKAGE).cls $(RESUMEEN).tex $(RESUMEEN).bbl
	xelatex $(RESUMEEN).tex
	xelatex $(RESUMEEN).tex

$(RESUMEEN).bbl: $(EXAMPLE).bib
	xelatex $(RESUMEEN).tex
	-bibtex $(RESUMEEN)

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
