#!/bin/bash

# Syntax: cardtopng.sh cardname.png
OUTPUT=$1
PDFNAME=$(echo "$1" | sed 's/\[.*\]\..*//').pdf

# Create initial png
pdftoppm -scale-to-x 750 -scale-to-y 1050 -png $PDFNAME > $OUTPUT

# Find border colour
BORDER_COL="#$(stream "$OUTPUT[1x1+0+0]" - | xxd -p)"
convert $OUTPUT -gravity center -background $BORDER_COL -extent 825x1125 $OUTPUT
