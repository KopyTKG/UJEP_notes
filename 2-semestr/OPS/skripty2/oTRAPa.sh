#!/bin/bash
#demonstrace odchytavani signalu

trap 'echo "NIC nebude" ' INT #odchyceni ctr-c
trap 'echo "UMRTI" ' KILL  #nelze odchytit

while [ true ]
do
sleep 1s
done
