% Funkcja obliczaj¹ca macierz transformacji uk³adu ostatniego do pierwszego
% dla modelu uwzglêdniaj¹cego b³êdy
% A nastêpnie zapisuj¹ca wartoœci wspó³rzêdnych X, Y i Z

function [T]=Td(z1, th1, th2, z3,dx0,dy0,dz0,delz0,dely0,delx0,dx1,dy1,dz1,delz1,dely1,delx1,dx2,dy2,dz2,delz2,dely2,delx2,dx3,dy3,dz3,delz3,dely3,delx3)

% Okreœlenie zmiennych symbolicznych 
% Zmienne te s¹ parametrami manipulatora (d³ugoœci i k¹ty obrotów)
% oraz b³êdami ustawienia manipulatora oraz jego pozycjonowania

syms z1 th1 th2 z3;
syms dx0 dy0 dz0 delz0 dely0 delx0; % B³êdy pierwszego uk³adu (bazowego)
syms dx1 dy1 dz1 delz1 dely1 delx1; % B³êdy drugiego uk³adu
syms dx2 dy2 dz2 delz2 dely2 delx2; % B³êdy trzeciego uk³adu
syms dx3 dy3 dz3 delz3 dely3 delx3; % B³êdy czwartego uk³adu

% Kilka zmiennych jest sum¹ b³êdu oraz parametrów manipulatora
% (d³ugoœci i k¹ty) na podstawie jego modelu nominalnego 
% i s¹ definiowane jak poni¿ej (zmienne pomocnicze).

% Okreœlenie macierzy przekszta³ceñ jednorodnych dla ka¿dego z uk³adów

A01=md(dx0, dy0, dz0, delz0, dely0, delx0);
A11=md(dx1, dy1, z1+dz1, th1+delz1, dely1, sym(pi/2)+delx1);
A21=md(dx2, dy2, dz2, th2+delz2, dely2, sym(-pi/2)+delx2);
A31=md(dx3, dy3, z3+dz3, delz3, dely3, delx3);

% Wyznaczenie macierzy transformacji

T03=A01*A11*A21*A31;

% Wyznaczenie po³o¿enia koñcówki efektora (wspo³rzêdne X, Y i Z)

T=[T03(1,4);T03(2,4);T03(3,4)];