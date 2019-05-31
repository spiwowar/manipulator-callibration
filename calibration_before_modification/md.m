% Funkcja okreœlaj¹ca macierz przekszta³cenia jednorodnego uk³adu
% dla modelu uwzglêdniaj¹cego b³êdy

function [A7]=md(x,y,z,th,fi,al)

% Definiowanie 6 macierzy (3 rotacji i 3 translacji) 

A1=trax(sym(x));
A2=tray(sym(y));
A3=traz(sym(z));
A4=rotz(sym(th));
A5=roty(sym(fi));
A6=rotx(sym(al));

% Tworzenie macierzy przekszta³cenia jednorodnego dla uk³adu
% na podstawie notacji Denavita-Hartenberga

A7=A1*A2*A3*A4*A5*A6;