#!/bin/bash

if [ -n "$1" ] &&  [ -n "$2" ]; then
 echo "$1 zdravi $2"
else
 echo "Spatne pouziti"
 exit 1
fi	
	
