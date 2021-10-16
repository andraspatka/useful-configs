#!/usr/bin/bash

if [ $# = 0 ]; then
    echo "Usage: ./png-pdf.sh <input>"
    echo "It takes <input>*.png files"
    exit 1;
fi

input=$(echo $1 | tr -d ".png")

#sudo apt-get install ghostscript imagemagick

echo "Merging png images into one PDF: ${input}.pdf"

convert -compress zip "${input}"*.png "${input}".pdf

echo "Merging successful!"
echo "Merged pdf file name: ${input}.pdf"

