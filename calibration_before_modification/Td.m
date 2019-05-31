% Funkcja obliczaj�ca macierz transformacji uk�adu ostatniego do pierwszego
% dla modelu uwzgl�dniaj�cego b��dy
% A nast�pnie zapisuj�ca warto�ci wsp�rz�dnych X, Y i Z

function [T]=Td(z1, th1, th2, z3,dx0,dy0,dz0,delz0,dely0,delx0,dx1,dy1,dz1,delz1,dely1,delx1,dx2,dy2,dz2,delz2,dely2,delx2,dx3,dy3,dz3,delz3,dely3,delx3)

% Okre�lenie zmiennych symbolicznych 
% Zmienne te s� parametrami manipulatora (d�ugo�ci i k�ty obrot�w)
% oraz b��dami ustawienia manipulatora oraz jego pozycjonowania

syms z1 th1 th2 z3;
syms dx0 dy0 dz0 delz0 dely0 delx0; % B��dy pierwszego uk�adu (bazowego)
syms dx1 dy1 dz1 delz1 dely1 delx1; % B��dy drugiego uk�adu
syms dx2 dy2 dz2 delz2 dely2 delx2; % B��dy trzeciego uk�adu
syms dx3 dy3 dz3 delz3 dely3 delx3; % B��dy czwartego uk�adu

% Kilka zmiennych jest sum� b��du oraz parametr�w manipulatora
% (d�ugo�ci i k�ty) na podstawie jego modelu nominalnego 
% i s� definiowane jak poni�ej (zmienne pomocnicze).

% Okre�lenie macierzy przekszta�ce� jednorodnych dla ka�dego z uk�ad�w

A01=md(dx0, dy0, dz0, delz0, dely0, delx0);
A11=md(dx1, dy1, z1+dz1, th1+delz1, dely1, sym(pi/2)+delx1);
A21=md(dx2, dy2, dz2, th2+delz2, dely2, sym(-pi/2)+delx2);
A31=md(dx3, dy3, z3+dz3, delz3, dely3, delx3);

% Wyznaczenie macierzy transformacji

T03=A01*A11*A21*A31;

% Wyznaczenie po�o�enia ko�c�wki efektora (wspo�rz�dne X, Y i Z)

T=[T03(1,4);T03(2,4);T03(3,4)];