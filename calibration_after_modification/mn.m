% Funkcja okre�laj�ca macierz przekszta�cenia jednorodnego uk�adu
% dla modelu nominalnego

function [A5]=mn(th,z,x,al)

% Definiowanie 4 macierzy (2 rotacji i 2 translacji) 

A1=rotz(sym(th));
A2=traz(sym(z));
A3=trax(sym(x));
A4=rotx(sym(al));

% Tworzenie macierzy przekszta�cenia jednorodnego dla uk�adu
% na podstawie notacji Denavita-Hartenberga

A5=A1*A2*A3*A4;