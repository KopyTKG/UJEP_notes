#!/bin/bash

kdo="VESMIR" #globalni

pozdrav() {
echo "obsah GLOBALNI promenne $koho"
local koholoc
koholoc=$1
echo "$kdo rika:"
echo "ahoj $koholoc"e

p1="Definovano uvnitr"
local p2
p2="Definovano uvnitr"
}

echo "Zadej jmeno"
read -s -t 10 koho #nacti do promenne nezobrazuj znaky a cekej max 10 sec
pozdrav $koho

echo "p1>>$p1<<"
echo "p2>>$p2<<"



