#!/bin/bash

# tool to make edits in pdf like:
# extracting odd|even pages with optional white-margin cropping

set -e

if [ $# -eq 0 ]
then
        echo "Missing options!"
        echo "(run $0 -h for help)"
        echo ""
        exit 0
fi

odd=false
even=false
crop=false
del=false

while getopts "hoecd" opt; do
	case $opt in
		o)
			odd=true ;;
		e)
			even=true ;;
		c)
			crop=true ;;
        d)
            del=true ;;
		h)
			echo "a pdf tool to extract even/odd pages with optional whitepadding crop"
                        echo ""
			echo "Usage:"
                        echo "pdftool.sh -o [INPUTFILE] [OUTPUTFILE]"
                        echo "pdftool.sh -ec [INPUTFILE] [OUTPUTFILE]"
                        echo ""
                        echo "   -e     to extract even pages"
                        echo "   -o     to extract odd pages"
                        echo "   -c     to apply optional cropping"
                        echo "   -d     delete original file"
                        echo "   -h     help (this output)"
                        exit 0
                        ;;
		*)
			echo "Unknown flag"; exit 1 ;;
	esac
done

# sanity check
input="$2"
output="$3"

if [ $OPTIND -eq 1 ]; then
    echo "Error: no flags supplied. Use -o or -e (and optionally -c)."
    exit 1
elif [[ -z "$input" ]]; then
	echo "Error: no input file passed."
	exit 1
elif ! [[ -f "$input" ]]; then
	echo "Error: not a proper input file."
	exit 1
elif [[ -z "$output" ]]; then
	echo "Error: no output file passed."
	exit 1
fi


# logic checks

if ! $odd && ! $even; then
	echo "choose odd or even bruh"
	exit 1
fi


if $odd && $even; then
	echo "choose EITHER odd or even bruh"
	exit 1
fi

# core

if $odd; then
	echo "extracting odd pages..."
	qpdf --empty --pages "$input" 1-z:odd  --  tmp.pdf
elif $even; then
	echo "extracting even pages..."
	qpdf --empty --pages "$input" 1-z:even -- tmp.pdf
fi

# opt deleting

if $del; then
    rm "$input"
fi

# opt cropping

if $crop; then
    echo "cropping..."
    pdfcrop tmp.pdf "$output"
else
    mv tmp.pdf "$output"
fi

echo "done. file: $output"



