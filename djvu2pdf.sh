#!/bin/sh

# convert DjVu -> PDF
# usage:  djvu2pdf.sh  <file.djvu>

i="$1"
echo "------------ converting $i to PDF ----------------";
o="$(basename "$i" .djvu).pdf"
echo "[ writing output to $o ] "

ddjvu -format=pdf -quality=85 -verbose "$i" "$o"
