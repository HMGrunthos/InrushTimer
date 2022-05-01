#!/bin/bash
bkFile=""
cFile="$1"
#if [[ ! -z "$cFile" ]]; then
#	echo "pdftk .pdf background $cFile.pdf output tempOut.pdf"
#else
#	echo "No input"
#	exit
#fi
while [[ ! -z $cFile ]]; do
	if [[ -z "$bkFile" ]]; then
		cp "$cFile" "accFile.pdf"
		bkFile="accFile.pdf"
	else
		pdftk "$bkFile" background "$cFile" output tempOut.pdf
		mv tempOut.pdf "$bkFile"
	fi
	shift
	cFile="$1"
done
