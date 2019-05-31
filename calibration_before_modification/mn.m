% Funkcja okreœlaj¹ca macierz przekszta³cenia jednorodnego uk³adu
% dla modelu nominalnego

function [A5]=mn(th,z,x,al)

% Definiowanie 4 macierzy (2 rotacji i 2 translacji) 

A1=rotz(sym(th));
A2=traz(sym(z));
A3=trax(sym(x));
A4=rotx(sym(al));

% Tworzenie macierzy przekszta³cenia jednorodnego dla uk³adu
% na podstawie notacji Denavita-Hartenberga

A5=A1*A2*A3*A4;