% Funkcja okre�laj�ca macierz translacji uk�adu wzgl�dem osi y

function [ty]=tray(y)

ty=[1,0,0,0;0,1,0,y;0,0,1,0;0,0,0,1];