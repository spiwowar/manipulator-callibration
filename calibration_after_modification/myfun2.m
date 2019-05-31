% Funkcja wyliczaj¹ca parametry dla modelu skalibrowanego na podstawie
% modelu nominalnego

function F = myfun2(x)

% Okreœlenie zmiennych globalnych, które zostan¹ zainicjowane 
% w programie g³ównym

global Polozenie_dokladne dlugosc1 dlugosc2 wektor_th1 wektor_th2;

% Okreœlenie zmiennych symbolicznych
syms thb zb ab alb; 
syms th1 z1 a1 al1; 
syms th2 z2 a2 al2;
syms th3 z3 a3 al3;

% Przypisujê wspó³rzêdne modelu nominalnego obliczone w funkcji do zmiennej
XYZ_nom=Tn2;

% Wykorzystujê po³o¿enie nominalne ze zmiennymi nowymi parametrami, które
% bêd¹ obliczane metod¹ najmniejszych kwadratów w programie g³ównym
Polozenie_nominalne(1,:)=double(subs(XYZ_nom(1,1),{thb, zb, ab, alb,th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{x(1),x(2),x(3),x(4), wektor_th1(:), dlugosc1, x(5), pi/2, wektor_th2(:),x(6),x(7),-pi/2,x(8),dlugosc2,x(9),x(10)}));
Polozenie_nominalne(2,:)=double(subs(XYZ_nom(2,1),{thb, zb, ab, alb,th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{x(1),x(2),x(3),x(4), wektor_th1(:), dlugosc1, x(5), pi/2, wektor_th2(:),x(6),x(7),-pi/2,x(8),dlugosc2,x(9),x(10)}));
Polozenie_nominalne(3,:)=double(subs(XYZ_nom(3,1),{thb, zb, ab, alb,th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{x(1),x(2),x(3),x(4), wektor_th1(:), dlugosc1, x(5), pi/2, wektor_th2(:),x(6),x(7),-pi/2,x(8),dlugosc2,x(9),x(10)}));

% Funkcja, która bêdzie szukaæ parametrów, dla których odleg³oœci
% wspó³rzêdnych po³o¿enia w modelu dok³adnym bêd¹ jak najmniejsze do modelu
% nominalnego z nowymi parametrami
F(:,:)=[Polozenie_dokladne(1,:)-Polozenie_nominalne(1,:);Polozenie_dokladne(2,:)-Polozenie_nominalne(2,:);Polozenie_dokladne(3,:)-Polozenie_nominalne(3,:)]
         