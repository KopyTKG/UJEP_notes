#!/bin/bash

tmp=1

while [ "$tmp" -le "20" ]
do
	echo $tmp
	sleep "$tmp"s
	tmp=$(($tmp+1))

done
