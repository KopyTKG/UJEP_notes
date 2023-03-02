#!/bin/bash
until who | grep "$1" > /dev/null
do
	sleep 30s
done
echo "Uzivatel $1 se prihlasil"
exit 0
