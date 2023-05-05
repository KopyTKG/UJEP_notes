#!/bin/bash

while IFS=; read -r name group pass
do
    useradd $name -G $group -p $pass
done < soubor.txt