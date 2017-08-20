.PHONY: all clean printrun cardrun cards deepclean pngs

CARDLIST=cards/list.txt
PRINTLIST=cards/print.txt
INFOLIST=cards/infolist.txt
CARDS=$(patsubst %.tex,%.pdf,$(shell find cards -name '*.tex'))
CARDRUN=$(shell cat $(CARDLIST) | grep -v \\\#)
PRINTRUN=$(shell cat $(PRINTLIST) | grep -v \\\#)
PNGRUN=$(shell cat $(PRINTLIST) | sort | uniq -c | sed -e 's/\([[:digit:]]\+\) \(.*\).pdf/\2[\1].png/')
INFORUN=$(shell cat $(INFOLIST) | sed -e 's/.pdf/[image].png/')

all:printrun cardrun explanation.pdf
printrun: printrun.pdf
cardrun: cardrun.pdf
inforun: inforun.pdf
cards: $(CARDS)
export: $(PNGRUN) $(INFORUN)

printrun.pdf: $(PRINTRUN)
	pdfunite $+ $@

cardrun.pdf: $(CARDRUN)
	pdfunite $+ $@

inforun.pdf: $(INFORUN)
	pdfunite $+ $@

%.pdf: %.tex
	xelatex --output-directory=$(@D) $^
	echo "$@" >> changelist.txt
	rm $*.aux
	rm $*.log

pngs: printrun.pdf
	pdftoppm -scale-to-x 825 -scale-to-y 1125 -png printrun.pdf printpngs-

clean:
	-find cards -name '*.pdf' -delete
	-rm list.pdf
	-rm -f printpngs-*
	-find . -name '*].png' -delete

# Rules for each multiplicity of png
%[1].png: %.pdf; ./cardtopng.sh $@
%[2].png: %.pdf; ./cardtopng.sh $@
%[3].png: %.pdf; ./cardtopng.sh $@
%[4].png: %.pdf; ./cardtopng.sh $@
%[5].png: %.pdf; ./cardtopng.sh $@
%[6].png: %.pdf; ./cardtopng.sh $@
%[7].png: %.pdf; ./cardtopng.sh $@
%[8].png: %.pdf; ./cardtopng.sh $@
%[9].png: %.pdf; ./cardtopng.sh $@
%[10].png: %.pdf; ./cardtopng.sh $@
%[11].png: %.pdf; ./cardtopng.sh $@
%[12].png: %.pdf; ./cardtopng.sh $@
%[13].png: %.pdf; ./cardtopng.sh $@
%[14].png: %.pdf; ./cardtopng.sh $@
%[15].png: %.pdf; ./cardtopng.sh $@
%[16].png: %.pdf; ./cardtopng.sh $@
%[17].png: %.pdf; ./cardtopng.sh $@
%[18].png: %.pdf; ./cardtopng.sh $@
%[19].png: %.pdf; ./cardtopng.sh $@
%[20].png: %.pdf; ./cardtopng.sh $@
%[21].png: %.pdf; ./cardtopng.sh $@
%[22].png: %.pdf; ./cardtopng.sh $@
%[23].png: %.pdf; ./cardtopng.sh $@
%[24].png: %.pdf; ./cardtopng.sh $@
%[25].png: %.pdf; ./cardtopng.sh $@
%[26].png: %.pdf; ./cardtopng.sh $@
%[27].png: %.pdf; ./cardtopng.sh $@
%[28].png: %.pdf; ./cardtopng.sh $@
%[29].png: %.pdf; ./cardtopng.sh $@
%[30].png: %.pdf; ./cardtopng.sh $@
%[31].png: %.pdf; ./cardtopng.sh $@
%[32].png: %.pdf; ./cardtopng.sh $@
%[33].png: %.pdf; ./cardtopng.sh $@
%[34].png: %.pdf; ./cardtopng.sh $@
%[35].png: %.pdf; ./cardtopng.sh $@
%[36].png: %.pdf; ./cardtopng.sh $@
%[image].png: %.pdf; ./cardtopng.sh $@
