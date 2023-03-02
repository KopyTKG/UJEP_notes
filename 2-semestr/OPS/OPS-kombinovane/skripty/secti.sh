#!/usr/bin/bash

if [ ! -z "$1" ] && [ ! -z "$2" ] && [ ! -z "$3" ]
then
	vysledek=$(($1+$2+$3))
elif  [ ! -z "$1" ] && [ ! -z "$2" ]
then
	vysledek=$(($1+$2))
else
	echo "chyba"
	exit 1
fi
  
echo "$vysledek"






#echo "$1+$2+$3=$vysledek
