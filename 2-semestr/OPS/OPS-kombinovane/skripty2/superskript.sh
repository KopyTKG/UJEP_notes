#!/bin/bash
#vnejsi skript, ktery spousti dalsi skript
echo "Spoustim vnejsi skript"
koho="Vesmir"

export koho #exportovani promenne do vnitrnich skriptu

./subscript.sh #spusteni na novem shelu

. ./subscript.sh #spusteni na puvodnim shelu, pokud to je zde spusteno, tak dalsi neprobiha, nebot ve subscriptu je volan exit 0

unset koho 
echo "po unsetu"
. ./subscript.sh #spusteni na puvodnim shelu

echo "vidim $koho"


