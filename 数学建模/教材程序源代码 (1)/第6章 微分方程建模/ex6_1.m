% diff_equ='x^2+y+(x-2*y)*Dy=0';
% dsolve(diff_equ,'x')

clc
clear all
syms y(x)
dsolve(x^2+y+(x-2*y)*diff(y)==0)
