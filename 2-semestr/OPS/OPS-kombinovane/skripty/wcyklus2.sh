#!/bin/bash
 find $HOME -type f -name "*.jpg" -o -name "*.png"  2> /dev/null > soubory.txt
while read soubor 
do
  #echo $soubor
  file $soubor
done < soubory.txt


