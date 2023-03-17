#!/bin/bash

jmeno=$(zenity --entry --text "Zadej jmeno souboru" --entry-text "*.txt" 2>/dev/null) #

arrdatum=($(date +"%Y %m %d")) #vytvor pole ($ retezec )
 
datum=$(zenity --calendar --text "Zadej datum vytvoreni" --title "Datum" --day ${arrdatum[2]} --month ${arrdatum[1]} --year ${arrdatum[0]} 2>/dev/null) 

adresar=$(zenity --file-selection --directory --filename=$HOME 2>/dev/null)

#uprava aktualniho datumu pro kalendar
cdatum=($(tr "." " " <<<$datum)) #preved si to na pole
delkam=$(wc -m <<<${cdatum[1]}) #zjisti delku mesice

if [ $delkam -le "2" ]; then
	#echo "kratke ${cdatum[1]}
	cdatum[1]="0${cdatum[1]}"
fi
#echo ${cdatum[1]}
#ignorovani data
#find $adresar -name "$jmeno"  2>/dev/null | tee >(zenity --progress --text "Hledam soubory v $adresar s maskou $jmeno stari $datumc" --pulsate --auto-close --no-cancel  2> /dev/null) > log.txt


find $adresar -name "$jmeno" -newermt "${cdatum[2]}-${cdatum[1]}-${cdatum[0]}" 2>/dev/null | tee >(zenity --progress --text "Hledam soubory v $adresar s maskou $jmeno stari $datumc" --pulsate --auto-close --no-cancel  2> /dev/null) > log.txt

cat < log.txt | zenity --text-info --width 530 --height 400 2>/dev/null  
