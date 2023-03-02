#!/usr/bin/octave

A=[1,2,3;4,5,6;7,8,9]
dA=det(A);
printf("Determinant je %f\n",dA)
b=[4;5;6]
x=A^-1*b

