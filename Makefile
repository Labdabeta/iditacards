.PHONY: all clean printrun cardrun cards deepclean pngs

CARDLIST=cards/list.txt
PRINTLIST=cards/print.txt
CARDS=$(patsubst %.tex,%.pdf,$(shell find cards -name '*.tex'))
CARDRUN=$(shell cat $(CARDLIST) | grep -v \\\#)
PRINTRUN=$(shell cat $(PRINTLIST) | grep -v \\\#)
PNGRUN=$(shell cat $(PRINTLIST) | sort | uniq -c | sed -e 's/\([[:digit:]]\+\) \(.*\).pdf/\2[\1].png/')

all:printrun cardrun explanation.pdf
printrun: printrun.pdf
cardrun: cardrun.pdf
cards: $(CARDS)
export: $(PNGRUN)

printrun.pdf: $(PRINTRUN)
	pdfunite $+ $@

cardrun.pdf: $(CARDRUN)
	pdfunite $+ $@

%.pdf: %.tex
	xelatex --output-directory=$(@D) $^
	echo "$@" >> changelist.txt

pngs: printrun.pdf
	pdftoppm -scale-to-x 825 -scale-to-y 1125 -png printrun.pdf printpngs-

clean:
	-find . -name '*.aux' -delete
	-find . -name '*.log' -delete

deepclean:
	-find cards -name '*.pdf' -delete
	-find . -name '*.aux' -delete
	-find . -name '*.log' -delete
	-rm -f printpngs-*
	-find . -name '*].png' -delete

# Rules for each multiplicity of png
%.png: %.pdf
	pdftoppm -scale-to-x 825 -scale-to-y 1125 -png $^ > $@

%[1].png: %.pdf
	pdftoppm -scale-to-x 825 -scale-to-y 1125 -png $^ > $@

%[2].png: %.pdf
	pdftoppm -scale-to-x 825 -scale-to-y 1125 -png $^ > $@

%[3].png: %.pdf
	pdftoppm -scale-to-x 825 -scale-to-y 1125 -png $^ > $@

%[4].png: %.pdf
	pdftoppm -scale-to-x 825 -scale-to-y 1125 -png $^ > $@

%[4].png: %.pdf
	pdftoppm -scale-to-x 825 -scale-to-y 1125 -png $^ > $@

%[8].png: %.pdf
	pdftoppm -scale-to-x 825 -scale-to-y 1125 -png $^ > $@

%[16].png: %.pdf
	pdftoppm -scale-to-x 825 -scale-to-y 1125 -png $^ > $@

%[36].png: %.pdf
	pdftoppm -scale-to-x 825 -scale-to-y 1125 -png $^ > $@

