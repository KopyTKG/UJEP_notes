#!/bin/bash

for soubor in $( ls -l| tr -s " " | grep -E "^-.*" | sort -t " " -n -k 5,5 | cut -d " " -f 8)
do
	echo $soubor
done
