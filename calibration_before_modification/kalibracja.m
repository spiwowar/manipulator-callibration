%% Program g��wny obliczaj�cy r�nic� po�o�enia modelu dokladnego od nominalnego
% rysuje wykres i za pomoc� funkcji myfun.m oblicza metod� najmniejszych
% kwadrat�w parametry modelu skalibrowanego i oblicza r�nic� po�o�enia
% modelu dok�adnego od skalibrowanego i rysuje drugi wykres.

clear all;
clc;

format long;

% Okre�lenie zmiennych globalnych, kt�re b�d� r�wnie� wykorzystywane w
% innych funkcjach

global krok dlugosc1 dlugosc2 wektor_th1 wektor_th2 Polozenie_dokladne kat_th1 wektor_dlugosc2;

% Okre�lenie zmiennych symbolicznych na kt�rych b�dziemy pracowa�

syms th1 z1 a1 al1; 
syms th2 z2 a2 al2;
syms th3 z3 a3 al3;

syms dx0 dy0 dz0 delz0 dely0 delx0; 
syms dx1 dy1 dz1 delz1 dely1 delx1;
syms dx2 dy2 dz2 delz2 dely2 delx2;
syms dx3 dy3 dz3 delz3 dely3 delx3;

krok=5; % Okre�lam liczb� zmiennych parametr�w dla kt�rych b�dzie 
% symulowany pomiar
% Liczba pomiar�w = krok^2
 
dlugosc1=700; % D�ugo�� pierwszego ramienia manipulatora [mm]
dlugosc2=500; % Dobieram warto�� d�ugo�ci 
% drugiego o zmiennych warto�ciach ramienia manipulatora [mm]
 
kat_th1=linspace(0,2*pi, krok); % Okre�lam warto�ci pierwszego zmiennego k�ta [rad]
kat_th2=linspace(-3*pi/4,3*pi/4,krok); % Okre�lam warto�ci drugiego % zmiennego k�ta [rad]
 
[macierz_th1, macierz_th2]=meshgrid(kat_th1,kat_th2); %Tworzenie % siatki dw�ch k�t�w
 
% Na podstawie siatki dw�ch k�t�w okre�lam wektory warto�ci tych k�t�w
wektor_th1=reshape(macierz_th1, 1, krok^2);
wektor_th2=reshape(macierz_th2, 1, krok^2);
 
% Przypisuj� wsp�rz�dne obliczone w funkcjach do zmiennych
XYZ_dokl=Td;
XYZ_nom=Tn;
 
% Obliczam po�o�enie dok�adne
Polozenie_dokladne(1,:)=double(subs(XYZ_dokl(1,1),{z1,th1,th2,z3,dx0,dy0,dz0,delz0,dely0,delx0,dx1,dy1,dz1,delz1,dely1,delx1,dx2,dy2,dz2,delz2,dely2,delx2,dx3,dy3,dz3,delz3,dely3,delx3},{dlugosc1, wektor_th1(:), wektor_th2(:), dlugosc2, 0.1,0.1,0,0,0,0,0.01,0,0,0,0,0,0,0,0,0,0.0000142,0,0,0,0.01,0,0,0}));
Polozenie_dokladne(2,:)=double(subs(XYZ_dokl(2,1),{z1,th1,th2,z3,dx0,dy0,dz0,delz0,dely0,delx0,dx1,dy1,dz1,delz1,dely1,delx1,dx2,dy2,dz2,delz2,dely2,delx2,dx3,dy3,dz3,delz3,dely3,delx3},{dlugosc1, wektor_th1(:), wektor_th2(:), dlugosc2, 0.1,0.1,0,0,0,0,0.01,0,0,0,0,0,0,0,0,0,0.0000142,0,0,0,0.01,0,0,0}));
Polozenie_dokladne(3,:)=double(subs(XYZ_dokl(3,1),{z1,th1,th2,z3,dx0,dy0,dz0,delz0,dely0,delx0,dx1,dy1,dz1,delz1,dely1,delx1,dx2,dy2,dz2,delz2,dely2,delx2,dx3,dy3,dz3,delz3,dely3,delx3},{dlugosc1, wektor_th1(:), wektor_th2(:), dlugosc2, 0.1,0.1,0,0,0,0,0.01,0,0,0,0,0,0,0,0,0,0.0000142,0,0,0,0.01,0,0,0}));
 



% Obliczam po�o�enie nominalne
Polozenie_nominalne(1,:)=double(subs(XYZ_nom(1,1),{th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{ wektor_th1(:), dlugosc1, 0, pi/2, wektor_th2(:),0,0,-pi/2,0,dlugosc2,0,0}));
Polozenie_nominalne(2,:)=double(subs(XYZ_nom(2,1),{th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{ wektor_th1(:), dlugosc1, 0, pi/2, wektor_th2(:),0,0,-pi/2,0,dlugosc2,0,0}));
Polozenie_nominalne(3,:)=double(subs(XYZ_nom(3,1),{th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{ wektor_th1(:), dlugosc1, 0, pi/2, wektor_th2(:),0,0,-pi/2,0,dlugosc2,0,0}));
 
% Obliczam odleg�o�� po�o�enia dok�adnego od nominalnego
odl_dok_nom(1,:)=sqrt((Polozenie_dokladne(1,:)-Polozenie_nominalne(1,:)).^2+(Polozenie_dokladne(2,:)-Polozenie_nominalne(2,:)).^2+(Polozenie_dokladne(3,:)-Polozenie_nominalne(3,:)).^2);
maksimum=max(odl_dok_nom)
minimum=min(odl_dok_nom)
% Tworz� macierz warto�ci odleg�o�ci potrzebn� do wykre�lenia wykresu
macierz_odl_dok_nom=reshape(odl_dok_nom, krok, krok)
 
% Rysuj� wykres
figure(1);
surf(macierz_th2, macierz_th1, macierz_odl_dok_nom);
grid on;
xlabel('th2 [rad]');
ylabel('z3 [mm]');
zlabel('Odleglosc [mm]');
title('R�nica po�o�enia dok�adnego od nominalnego dla th1=0 rad');



%% Wyznaczenie parametr�w modelu skalibrowanego

x0 = [0;0;0;0;0;0;0;0;0;0;0;0];
parametr=lsqnonlin(@myfun, x0);
parametr



%% Obliczenie po�o�enia modelu skalibrowanego u�ywaj�c obliczonych parametr�w
Polozenie_skalibrowane(1,:)=double(subs(XYZ_nom(1,1),{th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{ wektor_th1(:)+parametr(1), dlugosc1+parametr(2), parametr(3), pi/2+parametr(4), wektor_th2(:)+parametr(5),parametr(6),parametr(7),-pi/2+parametr(8),parametr(9),dlugosc2+parametr(10),parametr(11),parametr(12)}));
Polozenie_skalibrowane(2,:)=double(subs(XYZ_nom(2,1),{th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{ wektor_th1(:)+parametr(1), dlugosc1+parametr(2), parametr(3), pi/2+parametr(4), wektor_th2(:)+parametr(5),parametr(6),parametr(7),-pi/2+parametr(8),parametr(9),dlugosc2+parametr(10),parametr(11),parametr(12)}));
Polozenie_skalibrowane(3,:)=double(subs(XYZ_nom(3,1),{th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{ wektor_th1(:)+parametr(1), dlugosc1+parametr(2), parametr(3), pi/2+parametr(4), wektor_th2(:)+parametr(5),parametr(6),parametr(7),-pi/2+parametr(8),parametr(9),dlugosc2+parametr(10),parametr(11),parametr(12)}));

% Obliczam odleg�o�� po�o�enia dok�adnego od skalibrowanego
odl_dok_kal(1,:)=sqrt((Polozenie_dokladne(1,:)-Polozenie_skalibrowane(1,:)).^2+(Polozenie_dokladne(2,:)-Polozenie_skalibrowane(2,:)).^2+(Polozenie_dokladne(3,:)-Polozenie_skalibrowane(3,:)).^2);
       
% Tworz� macierz warto�ci odleg�o�ci potrzebn� do wykre�lenia wykresu
macierz_odl_dok_kal=reshape(odl_dok_kal, krok, krok);

% Rysuj� wykres
figure(2);
surf(macierz_th2, macierz_th1, macierz_odl_dok_kal);
grid on;
xlabel('th2 [rad]');
ylabel('z3 [mm]');
zlabel('Odleglosc [mm]');
title('R�nica po�o�enia dok�adnego od skalibrowanego dla th1=0 rad');

% Sprawdzam jak poprawi�y si� warto�ci po�o�enia i wyznaczam �redni�,
% maksymaln� i minimaln� popraw�
odleglosc_poprawiona=macierz_odl_dok_nom-macierz_odl_dok_kal

srednia=mean(mean(odleglosc_poprawiona))
max_poprawa=max(max(odleglosc_poprawiona))
min_poprawa=min(min(odleglosc_poprawiona))
