% Funkcja okreœlaj¹ca macierz translacji uk³adu wzglêdem osi y

function [ty]=tray(y)

ty=[1,0,0,0;0,1,0,y;0,0,1,0;0,0,0,1];