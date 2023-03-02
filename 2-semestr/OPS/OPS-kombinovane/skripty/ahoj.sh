#!/usr/bin/bash

echo "$0>$1>$2>$3"
echo "Rekni mi sve jmeno"
read jmeno
echo "Zdravim te:"$(tr a-z A-Z <<<$jmeno)

