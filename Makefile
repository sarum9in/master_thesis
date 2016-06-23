XELATEX = xelatex
XELATEXFLAGS = -halt-on-error

ALL=main.pdf presentation.pdf review.pdf alltex.txt

%.pdf: %.tex $(wildcard *.tex) resources
	$(XELATEX) $(XELATEXFLAGS) $<
	$(XELATEX) $(XELATEXFLAGS) $<

all: $(ALL)

alltex.txt: $(wildcard *.tex)
	cat $^ >$@

upload: $(ALL)
	scp $^ cs.istu.ru:public_html

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
