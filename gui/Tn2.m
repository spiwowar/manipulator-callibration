% Funkcja obliczaj¹ca macierz transformacji uk³adu ostatniego do pierwszego
% dla modelu nominalnego

function [T]=Tn2(thb, zb, ab, alb, th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3)

% Okreœlenie zmiennych symbolicznych 
% Zmienne te s¹ parametrami manipulatora (d³ugoœci i k¹ty obrotów)

syms thb zb ab alb;
syms th1 z1 a1 al1;
syms th2 z2 a2 al2;
syms th3 z3 a3 al3;


% Okreœlenie macierzy przekszta³ceñ jednorodnych dla ka¿dego z uk³adów

A0=mn(thb, zb, ab, alb);
A1=mn(th1, z1, a1, al1);
A2=mn(th2, z2, a2, al2);
A3=mn(th3, z3, a3, al3);

% Wyznaczenie macierzy transformacji

T03=A0*A1*A2*A3;

% Wyznaczenie po³o¿enia koñcówki efektora (wspo³rzêdne X, Y i Z)

T=[T03(1,4);T03(2,4);T03(3,4)];