% Funkcja okre�laj�ca macierz rotacji uk�adu wzgl�dem osi y

function [ry]=roty(fi)

ry=[cos(fi),0,sin(fi),0;0,1,0,0;-sin(fi),0,cos(fi),0;0,0,0,1];