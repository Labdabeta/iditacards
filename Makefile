.PHONY: all clean printrun cardrun
.PRECIOUS: %.pdf %.png

default: decks extras instructions
all: decks extras instructions export

instructions: outputs/instructions.pdf

extras:
	@cp iditaboard.png outputs/iditaboard.png
	@cp iditasingle.png outputs/iditasingle.png
	@cp cardback.png outputs/cardback.png

DECKLIST=$(shell ls cards/decks | sed -e 's/.txt//')
DEPENDLIST=$(DECKLIST:%=%.d)

outputs/%.d: cards/decks/%.txt
	sed -e 's@^@outputs/$*.pdf:@' < $< > $@
	cat $< | sort | uniq -c | sed -e 's@\([[:digit:]]\+\) \(.*\).pdf@export:: \2[\1].png; mv $$< outputs/$*/$$(<F)@' >> $@
	echo 'decks: outputs/$*.pdf' >> $@

include $(DECKLIST:%=outputs/%.d)

outputs/instructions.pdf: instructions.tex
	xelatex -interaction=batchmode -halt-on-error --output-directory=outputs $^

outputs/%.pdf:
	pdfunite $+ $@

%.pdf: %.tex
	xelatex -interaction=batchmode -halt-on-error --output-directory=$(@D) $^
	echo "$@" >> changelist.txt
	rm $*.aux
	rm $*.log

force-make:

clean:
	-find cards -name '*.pdf' -delete
	-find outputs -name '*.pdf' -delete
	-find outputs -name '*].png' -delete
	-find outputs -name '*.d' -delete

print-%  : ; @echo $* = $($*)

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
