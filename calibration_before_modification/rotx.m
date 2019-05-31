% Funkcja okreœlaj¹ca macierz rotacji uk³adu wzglêdem osi x

function [rx]=rotx(al)

rx=[1,0,0,0;0,cos(al),-sin(al),0;0,sin(al),cos(al),0;0,0,0,1];