.PHONY: all clean printrun cardrun
.PRECIOUS: %.pdf %.png

default: decks
all: decks export

DECKLIST=$(shell ls cards/decks | sed -e 's/.txt//')
DEPENDLIST=$(DECKLIST:%=%.d)

outputs/%.d: cards/decks/%.txt
	echo -n 'outputs/$*.pdf:' > $@
	tr '\n' ' ' < $< >> $@
	echo -e '\n\tpdfunite $$+ $$@' >> $@
	cat $< | sort | uniq -c | sed -e 's@\([[:digit:]]\+\) \(.\+/\)*\(.\+\).pdf@export: outputs/$*/\3[\1].png@' >> $@
	cat $< | sort | uniq -c | sed -e 's@\([[:digit:]]\+\) \(.\+/\)*\(.\+\).pdf@outputs/$*/\3[\1].png: \2\3[\1].png; cp \2\3[\1].png outputs/$*/\3[\1].png@' >> $@
	mkdir -p outputs/$*
	echo 'decks: outputs/$*.pdf' >> $@

include $(DECKLIST:%=outputs/%.d)

outputs/iditaleft[face].png: iditaboard.png
	convert iditaboard.png -crop 2400x2400+37+37 outputs/iditaleft[face]-raw.png
	convert outputs/iditaleft[face]-raw.png -set option:distort:viewport 2475x2475-37-37 -virtual-pixel Edge -distort SRT 0 outputs/iditaleft[face].png

outputs/iditaleft[back].png: iditasingle.png
	convert iditasingle.png -crop 2400x2400+37+37 outputs/iditaleft[back]-raw.png
	convert outputs/iditaleft[back]-raw.png -set option:distort:viewport 2475x2475-37-37 -virtual-pixel Edge -distort SRT 0 outputs/iditaleft[back].png

outputs/iditaright[face].png: iditaboard.png
	convert iditaboard.png -crop 2400x2400+2437+37 outputs/iditaright[face]-raw.png
	convert outputs/iditaright[face]-raw.png -set option:distort:viewport 2475x2475-37-37 -virtual-pixel Edge -distort SRT 0 outputs/iditaright[face].png

outputs/iditaright[back].png: iditasingle.png
	convert iditasingle.png -crop 2400x2400+2437+37 outputs/iditaright[back]-raw.png
	convert outputs/iditaright[back]-raw.png -set option:distort:viewport 2475x2475-37-37 -virtual-pixel Edge -distort SRT 0 outputs/iditaright[back].png

outputs/cardback.png: cardback.png
	cp $< $@

outputs/destroyed.png: destroyed.png
	cp $< $@

outputs/supplies.png: supplies.png
	cp $< $@

outputs/purple.png: purple.png
	cp $< $@

outputs/green.png: green.png
	cp $< $@

outputs/orange.png: orange.png
	cp $< $@

outputs/yellow.png: yellow.png
	cp $< $@

outputs/box[top].png: box_top.png
	cp $< $@

outputs/box[bottom].png: box_bottom.png
	cp $< $@

export: outputs/iditaleft[face].png outputs/iditaleft[back].png outputs/iditaright[face].png outputs/iditaright[back].png
export: outputs/cardback.png
export: outputs/destroyed.png outputs/supplies.png
export: outputs/purple.png outputs/green.png outputs/orange.png outputs/yellow.png
export: outputs/box[top].png outputs/box[bottom].png

%.pdf: %.tex
	xelatex -interaction=batchmode -halt-on-error --output-directory=$(@D) $^
	echo "$@" >> changelist.txt
	rm $*.aux
	rm $*.log

force-make:

clean:
	-find cards -name '*.pdf' -delete
	-find cards -name '*].png' -delete
	-find cards -name '*-raw.png' -delete
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
