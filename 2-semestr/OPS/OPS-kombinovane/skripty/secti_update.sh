#!/usr/bin/bash

if [ -n "$1" ]; then
	echo "alespon jeden"
	if [[ "$1" =~ ^[0-9]+$ ]] ; then # test zda to je cislo
		suma=$1
		while [ "$#" -gt "1" ]
		do 
			shift 1 # posun si to
			#TODO doplnit podminku na test zda je $1 cislo viz radek 5
			suma=$(($suma+$1))
		done
		echo $suma
	else
		echo "$1 neni cislo"
	fi
else
	echo "zadny parametr"
	exit 1
fi
