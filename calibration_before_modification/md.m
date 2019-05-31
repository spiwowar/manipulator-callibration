% Funkcja okre�laj�ca macierz przekszta�cenia jednorodnego uk�adu
% dla modelu uwzgl�dniaj�cego b��dy

function [A7]=md(x,y,z,th,fi,al)

% Definiowanie 6 macierzy (3 rotacji i 3 translacji) 

A1=trax(sym(x));
A2=tray(sym(y));
A3=traz(sym(z));
A4=rotz(sym(th));
A5=roty(sym(fi));
A6=rotx(sym(al));

% Tworzenie macierzy przekszta�cenia jednorodnego dla uk�adu
% na podstawie notacji Denavita-Hartenberga

A7=A1*A2*A3*A4*A5*A6;