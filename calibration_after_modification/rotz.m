% Funkcja okreœlaj¹ca macierz rotacji uk³adu wzglêdem osi z

function [rz]=rotz(th)

rz=[cos(th),-sin(th),0,0;sin(th),cos(th),0,0;0,0,1,0;0,0,0,1];


