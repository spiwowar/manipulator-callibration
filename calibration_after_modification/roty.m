% Funkcja okreœlaj¹ca macierz rotacji uk³adu wzglêdem osi y

function [ry]=roty(fi)

ry=[cos(fi),0,sin(fi),0;0,1,0,0;-sin(fi),0,cos(fi),0;0,0,0,1];