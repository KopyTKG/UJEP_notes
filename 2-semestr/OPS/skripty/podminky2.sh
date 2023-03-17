#!/bin/bash
#vstup cislo ve tvaru retezce
if  grep -E "^[[:digit:]]+$" <<< "$1" 2>&1 > /dev/null; then
	echo "Vstupem je cislo $1"
elif  grep -o -E "[[:digit:]]+" <<< "$1" 2>&1 >/dev/null  ;then
		echo "Cast je cislo"
	else
		echo "KO"
		exit 1
fi
exit 0
	
