% Funkcja wyliczaj�ca parametry dla modelu skalibrowanego na podstawie
% modelu nominalnego

function F = myfun2(x)

% Okre�lenie zmiennych globalnych, kt�re zostan� zainicjowane 
% w programie g��wnym

global Polozenie_dokladne dlugosc1 dlugosc2 wektor_th1 wektor_th2;

% Okre�lenie zmiennych symbolicznych
syms thb zb ab alb; 
syms th1 z1 a1 al1; 
syms th2 z2 a2 al2;
syms th3 z3 a3 al3;

% Przypisuj� wsp�rz�dne modelu nominalnego obliczone w funkcji do zmiennej
XYZ_nom=Tn2;

% Wykorzystuj� po�o�enie nominalne ze zmiennymi nowymi parametrami, kt�re
% b�d� obliczane metod� najmniejszych kwadrat�w w programie g��wnym
Polozenie_nominalne(1,:)=double(subs(XYZ_nom(1,1),{thb, zb, ab, alb,th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{x(1),x(2),x(3),x(4), wektor_th1(:), dlugosc1, x(5), pi/2, wektor_th2(:),x(6),x(7),-pi/2,x(8),dlugosc2,x(9),x(10)}));
Polozenie_nominalne(2,:)=double(subs(XYZ_nom(2,1),{thb, zb, ab, alb,th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{x(1),x(2),x(3),x(4), wektor_th1(:), dlugosc1, x(5), pi/2, wektor_th2(:),x(6),x(7),-pi/2,x(8),dlugosc2,x(9),x(10)}));
Polozenie_nominalne(3,:)=double(subs(XYZ_nom(3,1),{thb, zb, ab, alb,th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{x(1),x(2),x(3),x(4), wektor_th1(:), dlugosc1, x(5), pi/2, wektor_th2(:),x(6),x(7),-pi/2,x(8),dlugosc2,x(9),x(10)}));

% Funkcja, kt�ra b�dzie szuka� parametr�w, dla kt�rych odleg�o�ci
% wsp�rz�dnych po�o�enia w modelu dok�adnym b�d� jak najmniejsze do modelu
% nominalnego z nowymi parametrami
F(:,:)=[Polozenie_dokladne(1,:)-Polozenie_nominalne(1,:);Polozenie_dokladne(2,:)-Polozenie_nominalne(2,:);Polozenie_dokladne(3,:)-Polozenie_nominalne(3,:)]
         