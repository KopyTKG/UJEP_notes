#!/bin/bash

jmeno=$(zenity --entry --text "Zadej své jméno" --entry-text "James") #
prijmeni=$(zenity --entry --text "Zadej své prijmeni" --entry-text "Bond") #

#arr=($(date +"%Y %m %d")) #vytvor pole
 
datum=$(zenity --calendar --title "Zadej Datum narozeni" --day 1 --month 1 --year 1970) 

echo "Zadal jsi $jmeno $prijmeni $datum"
