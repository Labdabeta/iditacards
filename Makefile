.PHONY: all clean printrun cardrun
.PRECIOUS: %.pdf %.png

default: decks extras instructions
all: decks extras instructions export

instructions: outputs/instructions.pdf

extras:
	# Rotate the boards
	@convert -rotate "90" iditaboard.png outputs/iditaboard.png
	@convert -rotate "90" iditasingle.png outputs/iditasingle.png
	@cp cardback.png outputs/cardback.png
	@cp destroyed.png outputs/destroyed.png
	@cp supplies.png outputs/supplies.png
	@cp boxbottom.png outputs/boxbottom.png
	@cp boxtop.png outputs/boxtop.png

DECKLIST=$(shell ls cards/decks | sed -e 's/.txt//')
DEPENDLIST=$(DECKLIST:%=%.d)

outputs/%.d: cards/decks/%.txt
	sed -e 's@^@outputs/$*.pdf:@' < $< > $@
	cat $< | sort | uniq -c | sed -e 's@\([[:digit:]]\+\) \(.\+/\)*\(.\+\).pdf@export: outputs/$*/\3[\1].png@' >> $@
	cat $< | sort | uniq -c | sed -e 's@\([[:digit:]]\+\) \(.\+/\)*\(.\+\).pdf@outputs/$*/\3[\1].png: \2\3[\1].png; cp \2\3[\1].png outputs/$*/\3[\1].png@' >> $@
	mkdir -p outputs/$*
	echo 'decks: outputs/$*.pdf' >> $@

include $(DECKLIST:%=outputs/%.d)

outputs/instructions.pdf: instructions.tex
	xelatex -interaction=batchmode -halt-on-error --output-directory=outputs $^

export: outputs/instructions.pdf
	pdftoppm -scale-to-x 1050 -scale-to-y 1500 -png outputs/instructions.pdf outputs/instructions/i
	cd outputs/instructions; for i in $$(ls); do convert $$i -gravity center -background white -extent 1125x1575 $$i; done

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
	-find cards -name '*].png' -delete
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
