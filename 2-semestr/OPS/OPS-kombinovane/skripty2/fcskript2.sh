#!/bin/bash

potvrd()
{
	echo "Opravdu udelat?"
	while true
	do
		echo "Potvrd odpoved ano ne"
		read odpoved
		case "$odpoved" in
			[Aa] | [Aa][Nn][Oo] ) echo "OK";return 0;;
			[Nn] | [Nn][Ee] ) echo "KO";return 1;;
			* ) echo "spatna odpoved";
		esac
	done
}

echo "Vyberte soubor"
select soubor in $(ls -f $HOME) "KONEC"
do
	if [ "$soubor" == "KONEC" ]; then
		exit 0
	fi
	echo "Chcete zalohovat soubor $soubor"
	if potvrd ;then
		echo "zalohuji $soubor"
	else
		echo "nedelam nic"
	fi
	
done

