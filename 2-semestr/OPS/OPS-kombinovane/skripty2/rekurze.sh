#!/bin/bash
# musi byt kolik
echo ">>>$kolik"
if [ "$kolik" -gt "0" ]; then
 echo "ahoj svete"
 kolik=$(($kolik-1))
 . ./rekurze.sh
fi

