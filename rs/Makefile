DOT = $(addsuffix .dot.tex,$(basename $(wildcard *.dot)))
SH = $(addsuffix .sh.tex,$(basename $(wildcard *.sh)))
EPS = $(addsuffix .eps,$(basename $(wildcard *.msc) $(basename $(wildcard *.gnu))))
MP = $(addsuffix .eps,$(basename $(wildcard *.mp)))

all: $(DOT) $(SH) $(EPS) $(MP)

DOT2TEXFLAGS=--figonly --format=tikz

%.dot.tex: %.dot
	dot2tex $(DOT2TEXFLAGS) --output=$@ $<

%.eps: %.msc
	mscgen -T eps -o $@ -i $<

%.eps: %.ps
	ps2eps -f $< $@

%.eps: %.gnu %.txt
	gnuplot $<

%.ps: %.mp
	mpost -tex=xelatex $<

clean:
	$(RM) *.ps *.pdf *.log *.out *.dot.tex *.sh.tex *.eps

%.sh.tex: %.sh
	./$< >$@
