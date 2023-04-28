#!/bin/bash

count=0
resolut=0
for params in "$@"
do
    count=$(($count+1))
    resolut=$(($resolut+$params))
done;

aa=$(($resolut/$count))

echo "výsledek je = $aa"