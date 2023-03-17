#!/usr/bin/gnuplot

faktorial(n)=(n>1) ? n*faktorial(n-1):1;
set grid
set title "Porovnani faktorial a exponenciala"
plot [1:6] faktorial(x) , exp(x)
pause(-1)
