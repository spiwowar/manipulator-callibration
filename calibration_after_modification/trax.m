% Funkcja okre�laj�ca macierz translacji uk�adu wzgl�dem osi x

function [tx]=trax(x)

tx=[1,0,0,x;0,1,0,0;0,0,1,0;0,0,0,1];