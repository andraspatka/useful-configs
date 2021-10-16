#!/usr/bin/bash

print_usage() {
    echo "Usage: ./shrink-pdf.sh <input> <compress_level>"
    echo "It takes <input>.pdf file and produces <input>-compressed.pdf"
    echo "Compression levels: 1: /prepress - 300 dpi, good quality, big size"
    echo "                    2: /ebook - 150 dpi, medium quality, smaller size"
    echo "                    3: /screen - 72 dpi, low quality, smallest possible size"
}

if [ $# = 0 ]; then
    print_usage
    exit 1;
fi

input=$(echo $1 | tr -d ".pdf")
compress_level=$2

# install required software
# sudo apt-get install ghostscript

gs_pdf_settings=""
case "${compress_level}" in
    1)
        gs_pdf_settings="/prepress" ;;
    2)
        gs_pdf_settings="/ebook" ;;
    3)
        gs_pdf_settings="/screen";;
    *)
        echo "Incorrect compression level!"
        print_usage
        exit 1;
        ;;
esac

echo "Using $gs_pdf_settings compression"
output="${input}-compressed"

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=$gs_pdf_settings -dNOPAUSE -dQUIET -dBATCH -sOutputFile="${output}".pdf "${input}".pdf
gs_exit_code=$?

if [ $gs_exit_code != 0 ]; then
    
    rm "${input}_compressed.pdf"
    echo "Failed to compress PDF. Exiting..."
    exit $gs_exit_code;
else
    echo "Compression successful!"
    echo "Ouput file is: ${output}"
    exit 0;
fi