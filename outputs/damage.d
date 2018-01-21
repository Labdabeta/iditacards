outputs/damage.pdf:cards/damaged.pdf cards/damaged.pdf cards/damaged.pdf cards/damaged.pdf cards/damaged.pdf cards/damaged.pdf cards/damaged.pdf cards/damaged.pdf cards/damaged.pdf cards/damaged.pdf cards/damaged.pdf cards/damaged.pdf cards/damaged.pdf cards/damaged.pdf cards/damaged.pdf cards/damaged.pdf cards/damaged.pdf cards/damaged.pdf 
	pdfunite $+ $@
     export: outputs/damage/damaged[18].png
     outputs/damage/damaged[18].png: cards/damaged[18].png; cp cards/damaged[18].png outputs/damage/damaged[18].png
decks: outputs/damage.pdf
