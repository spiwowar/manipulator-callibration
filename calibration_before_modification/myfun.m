% Funkcja wyliczaj�ca parametry dla modelu skalibrowanego na podstawie
% modelu nominalnego

function F = myfun(x)

% Okre�lenie zmiennych globalnych, kt�re zostan� zainicjowane 
% w programie g��wnym

global Polozenie_dokladne dlugosc1 dlugosc2 wektor_th1 wektor_th2 kat_th1 wektor_dlugosc2;

% Okre�lenie zmiennych symbolicznych
syms th1 z1 a1 al1; 
syms th2 z2 a2 al2;
syms th3 z3 a3 al3;

% Przypisuj� wsp�rz�dne modelu nominalnego obliczone w funkcji do zmiennej
XYZ_nom=Tn;

% Wykorzystuj� po�o�enie nominalne ze zmiennymi nowymi parametrami, kt�re
% b�d� obliczane metod� najmniejszych kwadrat�w w programie g��wnym
Polozenie_nominalne(1,:)=double(subs(XYZ_nom(1,1),{th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{ kat_th1+x(1), dlugosc1+x(2), x(3), pi/2+x(4), wektor_th2(:)+x(5),x(6),x(7),-pi/2+x(8),x(9),wektor_dlugosc2(:)+x(10),x(11),x(12)}));
Polozenie_nominalne(2,:)=double(subs(XYZ_nom(2,1),{th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{ kat_th1+x(1), dlugosc1+x(2), x(3), pi/2+x(4), wektor_th2(:)+x(5),x(6),x(7),-pi/2+x(8),x(9),wektor_dlugosc2(:)+x(10),x(11),x(12)}));
Polozenie_nominalne(3,:)=double(subs(XYZ_nom(3,1),{th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{ kat_th1+x(1), dlugosc1+x(2), x(3), pi/2+x(4), wektor_th2(:)+x(5),x(6),x(7),-pi/2+x(8),x(9),wektor_dlugosc2(:)+x(10),x(11),x(12)}));

% Funkcja, kt�ra b�dzie szuka� parametr�w, dla kt�rych odleg�o�ci
% wsp�rz�dnych po�o�enia w modelu dok�adnym b�d� jak najmniejsze do modelu
% nominalnego z nowymi parametrami
F(:,:)=[Polozenie_dokladne(1,:)-Polozenie_nominalne(1,:);Polozenie_dokladne(2,:)-Polozenie_nominalne(2,:);Polozenie_dokladne(3,:)-Polozenie_nominalne(3,:)]
         