XELATEX = xelatex
XELATEXFLAGS = -halt-on-error

%.pdf: %.tex $(wildcard *.tex) resources
	$(XELATEX) $(XELATEXFLAGS) $<
	$(XELATEX) $(XELATEXFLAGS) $<

all: main.pdf presentation.pdf

open: main.pdf
	xdg-open $<

popen: presentation.pdf
	xdg-open $<

resources:
	$(MAKE) -C rs

clean:
	$(RM) *.pdf *.aux *.log *.toc *.nav *.snm *.out *.blg *.bbl
	$(MAKE) -C rs clean

.PHONY: open clean resources
