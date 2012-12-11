LATEX    = latex
DVIPS    = dvips

BASENAME = main

default: testlatex

testlatex:
	latex  ${BASENAME}
	latex  ${BASENAME}
	latex  ${BASENAME}
	latex  ${BASENAME}
	dvipdf -dPDFSETTINGS=/prepress ${BASENAME}

testpdflatex:
	pdflatex  ${BASENAME}
	pdflatex  ${BASENAME}
	pdflatex  ${BASENAME}
	pdflatex  ${BASENAME}

#
# standard Latex targets
#

%.dvi:	%.tex 
	$(LATEX) $<

%.bbl:	%.tex
	$(LATEX) $*

%.ps:	%.dvi
	$(DVIPS) $< -o $@

%.pdf:	%.tex
	$(PDFLATEX) $<

.PHONY: clean

clean:
	rm -f *.aux *.log *.bbl *.blg *.brf *.cb *.ind *.idx *.ilg  \
	      *.inx *.dvi *.toc *.out *~ ~* spellTmp 
