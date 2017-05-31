.PHONY: all clean printrun cardrun cards deepclean

CARDLIST=cards/list.txt
PRINTLIST=cards/print.txt
CARDS=$(patsubst %.tex,%.pdf,$(shell find cards -name '*.tex'))
CARDRUN=$(shell cat $(CARDLIST) | grep -v \\\#)
PRINTRUN=$(shell cat $(PRINTLIST) | grep -v \\\#)

all:printrun cardrun
printrun: printrun.pdf
cardrun: cardrun.pdf
cards: $(CARDS)

printrun.pdf: $(PRINTRUN)
	pdfunite $+ $@

cardrun.pdf: $(CARDRUN)
	pdfunite $+ $@

%.pdf: %.tex
	xelatex --output-directory=$(@D) $^
	echo "$@" >> changelist.txt

clean:
	-find . -name '*.aux' -delete
	-find . -name '*.log' -delete

deepclean:
	-find cards -name '*.pdf' -delete
	-find . -name '*.aux' -delete
	-find . -name '*.log' -delete
