#!/usr/bin/bash
#prvni skript
echo "Bezi skript $0"
echo "Seznam pozicnich parametru $@"
echo "Pocet pozicnich parametru $#"
echo "Nekolik parametru $1 $2 $3 ... $9"
echo "Zadej posun"
read posun
shift $posun #posun
echo $@
echo "A opet nekolik parametru $1 $2 $3 ... $9"
echo ">$posun"
echo '>>$posun'
exit 0


