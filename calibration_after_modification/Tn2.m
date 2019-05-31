% Funkcja obliczaj�ca macierz transformacji uk�adu ostatniego do pierwszego
% dla modelu nominalnego

function [T]=Tn2(thb, zb, ab, alb, th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3)

% Okre�lenie zmiennych symbolicznych 
% Zmienne te s� parametrami manipulatora (d�ugo�ci i k�ty obrot�w)

syms thb zb ab alb;
syms th1 z1 a1 al1;
syms th2 z2 a2 al2;
syms th3 z3 a3 al3;


% Okre�lenie macierzy przekszta�ce� jednorodnych dla ka�dego z uk�ad�w

A0=mn(thb, zb, ab, alb);
A1=mn(th1, z1, a1, al1);
A2=mn(th2, z2, a2, al2);
A3=mn(th3, z3, a3, al3);

% Wyznaczenie macierzy transformacji

T03=A0*A1*A2*A3;

% Wyznaczenie po�o�enia ko�c�wki efektora (wspo�rz�dne X, Y i Z)

T=[T03(1,4);T03(2,4);T03(3,4)];