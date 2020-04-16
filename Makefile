# +-----------------------------------------------------------------------------
# | File: Makefile
# | Author: huxuan
# | E-mail: i(at)huxuan.org
# | Created: 2012-12-18
# | Last modified: 2020-04-16
# | Description:
# |     Makefile for resumecls
# |
# | Copyrgiht (c) 2012-2020 by huxuan. All rights reserved.
# +-----------------------------------------------------------------------------

PACKAGE=resumecls

.PHONY: all cls doc clean distclean dist

all: doc

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

# clean & distclean

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
		*.pdf \
		*.tar.gz

dist: distclean cls doc
	touch $(PACKAGE).tar.gz
	tar zcvf $(PACKAGE).tar.gz ./$(PACKAGE).pdf --exclude=$(PACKAGE).tar.gz \
		--exclude-vcs --exclude-vcs-ignores  .
