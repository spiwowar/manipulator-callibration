function varargout = panel(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @panel_OpeningFcn, ...
                   'gui_OutputFcn',  @panel_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before panel is made visible.
function panel_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
handles.dx0=0.1;
handles.dy0=0.1;
handles.dz0=0;
handles.delz0=0;
handles.dely0=0;
handles.delx0=0;
handles.dx1=0.01;
handles.dy1=0;
handles.dz1=0;
handles.delz1=0;
handles.dely1=0;
handles.delx1=0;
handles.dx2=0;
handles.dy2=0;
handles.dz2=0;
handles.delz2=0;
handles.dely2=0.0000142;
handles.delx2=0;
handles.dx3=0;
handles.dy3=0;
handles.dz3=0.01;
handles.delz3=0;
handles.dely3=0;
handles.delx3=0;
handles.krok=5;

guidata(hObject, handles);


function varargout = panel_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function kalibracja_Callback(hObject, eventdata, handles)

format long;

% Okreœlenie zmiennych globalnych, które bêd¹ równie¿ wykorzystywane w
% innych funkcjach

global dlugosc1 dlugosc2 wektor_th1 wektor_th2 Polozenie_dokladne kat_th1 wektor_dlugosc2 kat_th2;

% Okreœlenie zmiennych symbolicznych na których bêdziemy pracowaæ
syms thb zb ab alb;
syms th1 z1 a1 al1; 
syms th2 z2 a2 al2;
syms th3 z3 a3 al3;
syms dx0 dy0 dz0 delz0 dely0 delx0; 
syms dx1 dy1 dz1 delz1 dely1 delx1;
syms dx2 dy2 dz2 delz2 dely2 delx2;
syms dx3 dy3 dz3 delz3 dely3 delx3;

%%
if (get(handles.stala_z3,'Value'))
    
dlugosc1=700; % D³ugoœæ pierwszego ramienia manipulatora [mm]
dlugosc2=500; % Dobieram wartoœæ d³ugoœci drugiego o zmiennych wartoœciach ramienia manipulatora [mm]

krok=handles.krok; % Okreœlam liczbê zmiennych parametrów dla których bêdzie symulowany pomiar
% Liczba pomiarów = krok^2

kat_th1=linspace(0,2*pi,krok); % Okreœlam wartoœci pierwszego zmiennego k¹ta [rad]
kat_th2=linspace(-3*pi/4,3*pi/4,krok); % Okreœlam wartoœci drugiego zmiennego k¹ta [rad]

[macierz_th1, macierz_th2]=meshgrid(kat_th1,kat_th2); %Tworzenie siatki dwóch k¹tów

% Na podstawie siatki dwóch k¹tów okreœlam wektory wartoœci tych k¹tów
wektor_th1=reshape(macierz_th1, 1, krok^2);
wektor_th2=reshape(macierz_th2, 1, krok^2);

% Przypisujê wspó³rzêdne obliczone w funkcjach do zmiennych
XYZ_dokl=Td;
XYZ_nom=Tn2;

Polozenie_dokladne=zeros(1:3,krok^2)
Polozenie_nominalne=zeros(1:3,krok^2)
% Obliczam po³o¿enie dok³adne
Polozenie_dokladne(1,:)=double(subs(XYZ_dokl(1,1),{z1,th1,th2,z3,dx0,dy0,dz0,delz0,dely0,delx0,dx1,dy1,dz1,delz1,dely1,delx1,dx2,dy2,dz2,delz2,dely2,delx2,dx3,dy3,dz3,delz3,dely3,delx3},{dlugosc1, wektor_th1(:), wektor_th2(:), dlugosc2, handles.dx0,handles.dy0,handles.dz0,handles.delz0,handles.dely0,handles.delx0,handles.dx1,handles.dy1,handles.dz1,handles.delz1,handles.dely1,handles.delx1,handles.dx2,handles.dy2,handles.dz2,handles.delz2,handles.dely2,handles.delx2,handles.dx3,handles.dy3,handles.dz3,handles.delz3,handles.dely3,handles.delx3}));
Polozenie_dokladne(2,:)=double(subs(XYZ_dokl(2,1),{z1,th1,th2,z3,dx0,dy0,dz0,delz0,dely0,delx0,dx1,dy1,dz1,delz1,dely1,delx1,dx2,dy2,dz2,delz2,dely2,delx2,dx3,dy3,dz3,delz3,dely3,delx3},{dlugosc1, wektor_th1(:), wektor_th2(:), dlugosc2, handles.dx0,handles.dy0,handles.dz0,handles.delz0,handles.dely0,handles.delx0,handles.dx1,handles.dy1,handles.dz1,handles.delz1,handles.dely1,handles.delx1,handles.dx2,handles.dy2,handles.dz2,handles.delz2,handles.dely2,handles.delx2,handles.dx3,handles.dy3,handles.dz3,handles.delz3,handles.dely3,handles.delx3}));
Polozenie_dokladne(3,:)=double(subs(XYZ_dokl(3,1),{z1,th1,th2,z3,dx0,dy0,dz0,delz0,dely0,delx0,dx1,dy1,dz1,delz1,dely1,delx1,dx2,dy2,dz2,delz2,dely2,delx2,dx3,dy3,dz3,delz3,dely3,delx3},{dlugosc1, wektor_th1(:), wektor_th2(:), dlugosc2, handles.dx0,handles.dy0,handles.dz0,handles.delz0,handles.dely0,handles.delx0,handles.dx1,handles.dy1,handles.dz1,handles.delz1,handles.dely1,handles.delx1,handles.dx2,handles.dy2,handles.dz2,handles.delz2,handles.dely2,handles.delx2,handles.dx3,handles.dy3,handles.dz3,handles.delz3,handles.dely3,handles.delx3}));

% Obliczam po³o¿enie nominalne
Polozenie_nominalne(1,:)=double(subs(XYZ_nom(1,1),{thb, zb, ab, alb, th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{0,0,0,0, wektor_th1(:), dlugosc1, 0, pi/2, wektor_th2(:),0,0,-pi/2,0,dlugosc2,0,0}));
Polozenie_nominalne(2,:)=double(subs(XYZ_nom(2,1),{thb, zb, ab, alb, th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{0,0,0,0, wektor_th1(:), dlugosc1, 0, pi/2, wektor_th2(:),0,0,-pi/2,0,dlugosc2,0,0}));
Polozenie_nominalne(3,:)=double(subs(XYZ_nom(3,1),{thb, zb, ab, alb, th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{0,0,0,0, wektor_th1(:), dlugosc1, 0, pi/2, wektor_th2(:),0,0,-pi/2,0,dlugosc2,0,0}));

% Obliczam odleg³oœæ po³o¿enia dok³adnego od nominalnego
odl_dok_nom(1,:)=sqrt((Polozenie_dokladne(1,:)-Polozenie_nominalne(1,:)).^2+(Polozenie_dokladne(2,:)-Polozenie_nominalne(2,:)).^2+(Polozenie_dokladne(3,:)-Polozenie_nominalne(3,:)).^2);
max_przed=max(odl_dok_nom);
min_przed=min(odl_dok_nom);
% Tworzê macierz wartoœci odleg³oœci potrzebn¹ do wykreœlenia wykresu
macierz_odl_dok_nom=reshape(odl_dok_nom, krok, krok)

% Rysujê wykres
axes(handles.axes1);
surf(macierz_th2, macierz_th1, macierz_odl_dok_nom);
grid on;
xlabel('th2 [rad]');
ylabel('th1 [rad]');
zlabel('Odleglosc [mm]');
title('Ró¿nica po³o¿enia dok³adnego od nominalnego dla z3=500 mm');

%% Wyznaczenie parametrów modelu skalibrowanego

x0 = [0;0;0;0;0;0;0;0;0;0];
parametr=lsqnonlin(@myfun2, x0);

%% Obliczenie po³o¿enia modelu skalibrowanego u¿ywaj¹c obliczonych parametrów
Polozenie_skalibrowane(1,:)=double(subs(XYZ_nom(1,1),{thb, zb, ab, alb,th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{parametr(1), parametr(2), parametr(3), parametr(4), wektor_th1(:), dlugosc1, parametr(5), pi/2, wektor_th2(:),parametr(6),parametr(7),-pi/2,parametr(8),dlugosc2,parametr(9),parametr(10)}));
Polozenie_skalibrowane(2,:)=double(subs(XYZ_nom(2,1),{thb, zb, ab, alb,th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{parametr(1), parametr(2), parametr(3), parametr(4), wektor_th1(:), dlugosc1, parametr(5), pi/2, wektor_th2(:),parametr(6),parametr(7),-pi/2,parametr(8),dlugosc2,parametr(9),parametr(10)}));
Polozenie_skalibrowane(3,:)=double(subs(XYZ_nom(3,1),{thb, zb, ab, alb,th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{parametr(1), parametr(2), parametr(3), parametr(4), wektor_th1(:), dlugosc1, parametr(5), pi/2, wektor_th2(:),parametr(6),parametr(7),-pi/2,parametr(8),dlugosc2,parametr(9),parametr(10)}));

% Obliczam odleg³oœæ po³o¿enia dok³adnego od skalibrowanego
odl_dok_kal(1,:)=sqrt((Polozenie_dokladne(1,:)-Polozenie_skalibrowane(1,:)).^2+(Polozenie_dokladne(2,:)-Polozenie_skalibrowane(2,:)).^2+(Polozenie_dokladne(3,:)-Polozenie_skalibrowane(3,:)).^2);
max_po=max(odl_dok_kal);
min_po=min(odl_dok_kal);
% Tworzê macierz wartoœci odleg³oœci potrzebn¹ do wykreœlenia wykresu
macierz_odl_dok_kal=reshape(odl_dok_kal, krok, krok)

% Rysujê wykres
axes(handles.axes2);
surf(macierz_th2, macierz_th1, macierz_odl_dok_kal);
grid on;
xlabel('th2 [rad]');
ylabel('th1 [rad]');
zlabel('Odleglosc [mm]');
title('Ró¿nica po³o¿enia dok³adnego od skalibrowanego dla z3=500 mm');

% Sprawdzam jak poprawi³y siê wartoœci po³o¿enia i wyznaczam œredni¹,
% maksymaln¹ i minimaln¹ poprawê
odleglosc_poprawiona=macierz_odl_dok_nom-macierz_odl_dok_kal

srednia=mean(mean(odleglosc_poprawiona));
max_poprawa=max(max(odleglosc_poprawiona));
min_poprawa=min(min(odleglosc_poprawiona));

set(handles.parametr1,'String',parametr(1));
set(handles.parametr2,'String',parametr(2));
set(handles.parametr3,'String',parametr(3));
set(handles.parametr4,'String',parametr(4));
set(handles.parametr5,'String',parametr(5));
set(handles.parametr6,'String',parametr(6));
set(handles.parametr7,'String',parametr(7));
set(handles.parametr8,'String',parametr(8));
set(handles.parametr9,'String',parametr(9));
set(handles.parametr10,'String',parametr(10));
set(handles.panel_model,'Title','Model skalibrowany');

set(handles.srednia_wp,'String',srednia);
set(handles.max_wp,'String',max_poprawa);
set(handles.min_wp,'String',min_poprawa);
set(handles.max_przed,'String',max_przed);
set(handles.max_po,'String',max_po);
set(handles.min_przed,'String',min_przed);
set(handles.min_po,'String',min_po);

elseif (get(handles.stala_th1,'Value'))
     
dlugosc1=700; % D³ugoœæ pierwszego ramienia manipulatora [mm]
kat_th1=0; % Dobieram wartoœæ d³ugoœci drugiego o zmiennych wartoœciach ramienia manipulatora [mm]

krok=handles.krok; % Okreœlam liczbê zmiennych parametrów dla których bêdzie symulowany pomiar
% Liczba pomiarów = krok^2

dlugosc2=linspace(250, 750,krok); % Okreœlam wartoœci pierwszego zmiennego k¹ta [rad]
kat_th2=linspace(-3*pi/4,3*pi/4,krok); % Okreœlam wartoœci drugiego zmiennego k¹ta [rad]

[macierz_dlugosc2, macierz_th2]=meshgrid(dlugosc2,kat_th2); %Tworzenie siatki dwóch k¹tów

% Na podstawie siatki dwóch k¹tów okreœlam wektory wartoœci tych k¹tów
wektor_dlugosc2=reshape(macierz_dlugosc2, 1, krok^2);
wektor_th2=reshape(macierz_th2, 1, krok^2);

% Przypisujê wspó³rzêdne obliczone w funkcjach do zmiennych
XYZ_dokl=Td;
XYZ_nom=Tn2;
Polozenie_dokladne=zeros(1:3,krok^2)
Polozenie_nominalne=zeros(1:3,krok^2)
% Obliczam po³o¿enie dok³adne
Polozenie_dokladne(1,:)=double(subs(XYZ_dokl(1,1),{z1,th1,th2,z3,dx0,dy0,dz0,delz0,dely0,delx0,dx1,dy1,dz1,delz1,dely1,delx1,dx2,dy2,dz2,delz2,dely2,delx2,dx3,dy3,dz3,delz3,dely3,delx3},{dlugosc1, kat_th1, wektor_th2(:), wektor_dlugosc2(:), handles.dx0,handles.dy0,handles.dz0,handles.delz0,handles.dely0,handles.delx0,handles.dx1,handles.dy1,handles.dz1,handles.delz1,handles.dely1,handles.delx1,handles.dx2,handles.dy2,handles.dz2,handles.delz2,handles.dely2,handles.delx2,handles.dx3,handles.dy3,handles.dz3,handles.delz3,handles.dely3,handles.delx3}));
Polozenie_dokladne(2,:)=double(subs(XYZ_dokl(2,1),{z1,th1,th2,z3,dx0,dy0,dz0,delz0,dely0,delx0,dx1,dy1,dz1,delz1,dely1,delx1,dx2,dy2,dz2,delz2,dely2,delx2,dx3,dy3,dz3,delz3,dely3,delx3},{dlugosc1, kat_th1, wektor_th2(:), wektor_dlugosc2(:), handles.dx0,handles.dy0,handles.dz0,handles.delz0,handles.dely0,handles.delx0,handles.dx1,handles.dy1,handles.dz1,handles.delz1,handles.dely1,handles.delx1,handles.dx2,handles.dy2,handles.dz2,handles.delz2,handles.dely2,handles.delx2,handles.dx3,handles.dy3,handles.dz3,handles.delz3,handles.dely3,handles.delx3}));
Polozenie_dokladne(3,:)=double(subs(XYZ_dokl(3,1),{z1,th1,th2,z3,dx0,dy0,dz0,delz0,dely0,delx0,dx1,dy1,dz1,delz1,dely1,delx1,dx2,dy2,dz2,delz2,dely2,delx2,dx3,dy3,dz3,delz3,dely3,delx3},{dlugosc1, kat_th1, wektor_th2(:), wektor_dlugosc2(:), handles.dx0,handles.dy0,handles.dz0,handles.delz0,handles.dely0,handles.delx0,handles.dx1,handles.dy1,handles.dz1,handles.delz1,handles.dely1,handles.delx1,handles.dx2,handles.dy2,handles.dz2,handles.delz2,handles.dely2,handles.delx2,handles.dx3,handles.dy3,handles.dz3,handles.delz3,handles.dely3,handles.delx3}));

% Obliczam po³o¿enie nominalne
Polozenie_nominalne(1,:)=double(subs(XYZ_nom(1,1),{thb, zb, ab, alb, th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{0,0,0,0, kat_th1, dlugosc1, 0, pi/2, wektor_th2(:),0,0,-pi/2,0,wektor_dlugosc2(:),0,0}));
Polozenie_nominalne(2,:)=double(subs(XYZ_nom(2,1),{thb, zb, ab, alb, th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{0,0,0,0, kat_th1, dlugosc1, 0, pi/2, wektor_th2(:),0,0,-pi/2,0,wektor_dlugosc2(:),0,0}));
Polozenie_nominalne(3,:)=double(subs(XYZ_nom(3,1),{thb, zb, ab, alb, th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{0,0,0,0, kat_th1, dlugosc1, 0, pi/2, wektor_th2(:),0,0,-pi/2,0,wektor_dlugosc2(:),0,0}));

% Obliczam odleg³oœæ po³o¿enia dok³adnego od nominalnego
odl_dok_nom(1,:)=sqrt((Polozenie_dokladne(1,:)-Polozenie_nominalne(1,:)).^2+(Polozenie_dokladne(2,:)-Polozenie_nominalne(2,:)).^2+(Polozenie_dokladne(3,:)-Polozenie_nominalne(3,:)).^2);
max_przed=max(odl_dok_nom);
min_przed=min(odl_dok_nom);
% Tworzê macierz wartoœci odleg³oœci potrzebn¹ do wykreœlenia wykresu
macierz_odl_dok_nom=reshape(odl_dok_nom, krok, krok)

% Rysujê wykres
axes(handles.axes1);
surf(macierz_th2, macierz_dlugosc2, macierz_odl_dok_nom);
grid on;
xlabel('th2 [rad]');
ylabel('z3 [mm]');
zlabel('Odleglosc [mm]');
title('Ró¿nica po³o¿enia dok³adnego od nominalnego dla th1=0 rad');


%% Wyznaczenie parametrów modelu skalibrowanego

x0 = [0;0;0;0;0;0;0;0;0;0];
parametr=lsqnonlin(@myfun22, x0);

%% Obliczenie po³o¿enia modelu skalibrowanego u¿ywaj¹c obliczonych parametrów
Polozenie_skalibrowane(1,:)=double(subs(XYZ_nom(1,1),{thb, zb, ab, alb,th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{parametr(1), parametr(2), parametr(3), parametr(4), kat_th1, dlugosc1, parametr(5), pi/2, wektor_th2(:),parametr(6),parametr(7),-pi/2,parametr(8),wektor_dlugosc2(:),parametr(9),parametr(10)}));
Polozenie_skalibrowane(2,:)=double(subs(XYZ_nom(2,1),{thb, zb, ab, alb,th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{parametr(1), parametr(2), parametr(3), parametr(4), kat_th1, dlugosc1, parametr(5), pi/2, wektor_th2(:),parametr(6),parametr(7),-pi/2,parametr(8),wektor_dlugosc2(:),parametr(9),parametr(10)}));
Polozenie_skalibrowane(3,:)=double(subs(XYZ_nom(3,1),{thb, zb, ab, alb,th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{parametr(1), parametr(2), parametr(3), parametr(4), kat_th1, dlugosc1, parametr(5), pi/2, wektor_th2(:),parametr(6),parametr(7),-pi/2,parametr(8),wektor_dlugosc2(:),parametr(9),parametr(10)}));

% Obliczam odleg³oœæ po³o¿enia dok³adnego od skalibrowanego
odl_dok_kal(1,:)=sqrt((Polozenie_dokladne(1,:)-Polozenie_skalibrowane(1,:)).^2+(Polozenie_dokladne(2,:)-Polozenie_skalibrowane(2,:)).^2+(Polozenie_dokladne(3,:)-Polozenie_skalibrowane(3,:)).^2);
       
% Tworzê macierz wartoœci odleg³oœci potrzebn¹ do wykreœlenia wykresu
macierz_odl_dok_kal=reshape(odl_dok_kal, krok, krok)
max_po=max(odl_dok_kal);
min_po=min(odl_dok_kal);
% Rysujê wykres
axes(handles.axes2);
surf(macierz_th2, macierz_dlugosc2, macierz_odl_dok_kal);
grid on;
xlabel('th2 [rad]');
ylabel('z3 [mm]');
zlabel('Odleglosc [mm]');
title('Ró¿nica po³o¿enia dok³adnego od skalibrowanego dla th1=0 rad');

% Sprawdzam jak poprawi³y siê wartoœci po³o¿enia i wyznaczam œredni¹,
% maksymaln¹ i minimaln¹ poprawê
odleglosc_poprawiona=macierz_odl_dok_nom-macierz_odl_dok_kal

srednia=mean(mean(odleglosc_poprawiona))
max_poprawa=max(max(odleglosc_poprawiona))
min_poprawa=min(min(odleglosc_poprawiona))

set(handles.parametr1,'String',parametr(1));
set(handles.parametr2,'String',parametr(2));
set(handles.parametr3,'String',parametr(3));
set(handles.parametr4,'String',parametr(4));
set(handles.parametr5,'String',parametr(5));
set(handles.parametr6,'String',parametr(6));
set(handles.parametr7,'String',parametr(7));
set(handles.parametr8,'String',parametr(8));
set(handles.parametr9,'String',parametr(9));
set(handles.parametr10,'String',parametr(10));
set(handles.panel_model,'Title','Model skalibrowany');
set(handles.srednia_wp,'String',srednia);
set(handles.max_wp,'String',max_poprawa);
set(handles.min_wp,'String',min_poprawa);
set(handles.max_przed,'String',max_przed);
set(handles.max_po,'String',max_po);
set(handles.min_przed,'String',min_przed);
set(handles.min_po,'String',min_po);

elseif (get(handles.stala_th2,'Value'))
    
dlugosc1=700; % D³ugoœæ pierwszego ramienia manipulatora [mm]
kat_th2=0; % Dobieram wartoœæ d³ugoœci drugiego o zmiennych wartoœciach ramienia manipulatora [mm]

krok=handles.krok; % Okreœlam liczbê zmiennych parametrów dla których bêdzie symulowany pomiar
% Liczba pomiarów = krok^2

kat_th1=linspace(0,2*pi,krok); % Okreœlam wartoœci pierwszego zmiennego k¹ta [rad]
dlugosc2=linspace(250, 750,krok); % Okreœlam wartoœci drugiego zmiennego k¹ta [rad]

[macierz_th1, macierz_dlugosc2]=meshgrid(kat_th1,dlugosc2); %Tworzenie siatki dwóch k¹tów

% Na podstawie siatki dwóch k¹tów okreœlam wektory wartoœci tych k¹tów
wektor_th1=reshape(macierz_th1, 1, krok^2);
wektor_dlugosc2=reshape(macierz_dlugosc2, 1, krok^2);

% Przypisujê wspó³rzêdne obliczone w funkcjach do zmiennych
XYZ_dokl=Td;
XYZ_nom=Tn2;
Polozenie_dokladne=zeros(1:3,krok^2)
Polozenie_nominalne=zeros(1:3,krok^2)
% Obliczam po³o¿enie dok³adne
Polozenie_dokladne(1,:)=double(subs(XYZ_dokl(1,1),{z1,th1,th2,z3,dx0,dy0,dz0,delz0,dely0,delx0,dx1,dy1,dz1,delz1,dely1,delx1,dx2,dy2,dz2,delz2,dely2,delx2,dx3,dy3,dz3,delz3,dely3,delx3},{dlugosc1, wektor_th1(:), kat_th2, wektor_dlugosc2(:), handles.dx0,handles.dy0,handles.dz0,handles.delz0,handles.dely0,handles.delx0,handles.dx1,handles.dy1,handles.dz1,handles.delz1,handles.dely1,handles.delx1,handles.dx2,handles.dy2,handles.dz2,handles.delz2,handles.dely2,handles.delx2,handles.dx3,handles.dy3,handles.dz3,handles.delz3,handles.dely3,handles.delx3}));
Polozenie_dokladne(2,:)=double(subs(XYZ_dokl(2,1),{z1,th1,th2,z3,dx0,dy0,dz0,delz0,dely0,delx0,dx1,dy1,dz1,delz1,dely1,delx1,dx2,dy2,dz2,delz2,dely2,delx2,dx3,dy3,dz3,delz3,dely3,delx3},{dlugosc1, wektor_th1(:), kat_th2, wektor_dlugosc2(:), handles.dx0,handles.dy0,handles.dz0,handles.delz0,handles.dely0,handles.delx0,handles.dx1,handles.dy1,handles.dz1,handles.delz1,handles.dely1,handles.delx1,handles.dx2,handles.dy2,handles.dz2,handles.delz2,handles.dely2,handles.delx2,handles.dx3,handles.dy3,handles.dz3,handles.delz3,handles.dely3,handles.delx3}));
Polozenie_dokladne(3,:)=double(subs(XYZ_dokl(3,1),{z1,th1,th2,z3,dx0,dy0,dz0,delz0,dely0,delx0,dx1,dy1,dz1,delz1,dely1,delx1,dx2,dy2,dz2,delz2,dely2,delx2,dx3,dy3,dz3,delz3,dely3,delx3},{dlugosc1, wektor_th1(:), kat_th2, wektor_dlugosc2(:), handles.dx0,handles.dy0,handles.dz0,handles.delz0,handles.dely0,handles.delx0,handles.dx1,handles.dy1,handles.dz1,handles.delz1,handles.dely1,handles.delx1,handles.dx2,handles.dy2,handles.dz2,handles.delz2,handles.dely2,handles.delx2,handles.dx3,handles.dy3,handles.dz3,handles.delz3,handles.dely3,handles.delx3}));

% Obliczam po³o¿enie nominalne
Polozenie_nominalne(1,:)=double(subs(XYZ_nom(1,1),{thb, zb, ab, alb, th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{0,0,0,0, wektor_th1(:), dlugosc1, 0, pi/2, kat_th2,0,0,-pi/2,0,wektor_dlugosc2(:),0,0}));
Polozenie_nominalne(2,:)=double(subs(XYZ_nom(2,1),{thb, zb, ab, alb, th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{0,0,0,0, wektor_th1(:), dlugosc1, 0, pi/2, kat_th2,0,0,-pi/2,0,wektor_dlugosc2(:),0,0}));
Polozenie_nominalne(3,:)=double(subs(XYZ_nom(3,1),{thb, zb, ab, alb, th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{0,0,0,0, wektor_th1(:), dlugosc1, 0, pi/2, kat_th2,0,0,-pi/2,0,wektor_dlugosc2(:),0,0}));

% Obliczam odleg³oœæ po³o¿enia dok³adnego od nominalnego
odl_dok_nom(1,:)=sqrt((Polozenie_dokladne(1,:)-Polozenie_nominalne(1,:)).^2+(Polozenie_dokladne(2,:)-Polozenie_nominalne(2,:)).^2+(Polozenie_dokladne(3,:)-Polozenie_nominalne(3,:)).^2);
max_przed=max(odl_dok_nom);
min_przed=min(odl_dok_nom);
% Tworzê macierz wartoœci odleg³oœci potrzebn¹ do wykreœlenia wykresu
macierz_odl_dok_nom=reshape(odl_dok_nom, krok, krok)

% Rysujê wykres
axes(handles.axes1);
surf(macierz_dlugosc2, macierz_th1, macierz_odl_dok_nom);
grid on;
xlabel('z3 [mm]');
ylabel('th1 [rad]');
zlabel('Odleglosc [mm]');
title('Ró¿nica po³o¿enia dok³adnego od nominalnego dla th2=0 rad');

%% Wyznaczenie parametrów modelu skalibrowanego

x0 = [0;0;0;0;0;0;0;0;0;0];
parametr=lsqnonlin(@myfun23, x0);

%% Obliczenie po³o¿enia modelu skalibrowanego u¿ywaj¹c obliczonych parametrów
Polozenie_skalibrowane(1,:)=double(subs(XYZ_nom(1,1),{thb, zb, ab, alb,th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{parametr(1), parametr(2), parametr(3), parametr(4), wektor_th1(:), dlugosc1, parametr(5), pi/2, kat_th2,parametr(6),parametr(7),-pi/2,parametr(8),wektor_dlugosc2(:),parametr(9),parametr(10)}));
Polozenie_skalibrowane(2,:)=double(subs(XYZ_nom(2,1),{thb, zb, ab, alb,th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{parametr(1), parametr(2), parametr(3), parametr(4), wektor_th1(:), dlugosc1, parametr(5), pi/2, kat_th2,parametr(6),parametr(7),-pi/2,parametr(8),wektor_dlugosc2(:),parametr(9),parametr(10)}));
Polozenie_skalibrowane(3,:)=double(subs(XYZ_nom(3,1),{thb, zb, ab, alb,th1, z1, a1, al1, th2, z2, a2, al2, th3, z3, a3, al3},{parametr(1), parametr(2), parametr(3), parametr(4), wektor_th1(:), dlugosc1, parametr(5), pi/2, kat_th2,parametr(6),parametr(7),-pi/2,parametr(8),wektor_dlugosc2(:),parametr(9),parametr(10)}));

% Obliczam odleg³oœæ po³o¿enia dok³adnego od skalibrowanego
odl_dok_kal(1,:)=sqrt((Polozenie_dokladne(1,:)-Polozenie_skalibrowane(1,:)).^2+(Polozenie_dokladne(2,:)-Polozenie_skalibrowane(2,:)).^2+(Polozenie_dokladne(3,:)-Polozenie_skalibrowane(3,:)).^2);
max_po=max(odl_dok_kal);
min_po=min(odl_dok_kal);
% Tworzê macierz wartoœci odleg³oœci potrzebn¹ do wykreœlenia wykresu
macierz_odl_dok_kal=reshape(odl_dok_kal, krok, krok)

% Rysujê wykres
axes(handles.axes2);
surf(macierz_dlugosc2, macierz_th1, macierz_odl_dok_kal);
grid on;
xlabel('z3 [mm]');
ylabel('th1 [rad]');
zlabel('Odleglosc [mm]');
title('Ró¿nica po³o¿enia dok³adnego od skalibrowanego dla th2=0 rad');

% Sprawdzam jak poprawi³y siê wartoœci po³o¿enia i wyznaczam œredni¹,
% maksymaln¹ i minimaln¹ poprawê
odleglosc_poprawiona=macierz_odl_dok_nom-macierz_odl_dok_kal

srednia=mean(mean(odleglosc_poprawiona))
max_poprawa=max(max(odleglosc_poprawiona))
min_poprawa=min(min(odleglosc_poprawiona))

set(handles.parametr1,'String',parametr(1));
set(handles.parametr2,'String',parametr(2));
set(handles.parametr3,'String',parametr(3));
set(handles.parametr4,'String',parametr(4));
set(handles.parametr5,'String',parametr(5));
set(handles.parametr6,'String',parametr(6));
set(handles.parametr7,'String',parametr(7));
set(handles.parametr8,'String',parametr(8));
set(handles.parametr9,'String',parametr(9));
set(handles.parametr10,'String',parametr(10));
set(handles.panel_model,'Title','Model skalibrowany');
set(handles.srednia_wp,'String',srednia);
set(handles.max_wp,'String',max_poprawa);
set(handles.min_wp,'String',min_poprawa);
set(handles.max_przed,'String',max_przed);
set(handles.max_po,'String',max_po);
set(handles.min_przed,'String',min_przed);
set(handles.min_po,'String',min_po);

end


function stala_z3_Callback(hObject, eventdata, handles)
if get(handles.stala_z3,'Value')
    set(handles.stala_th1,'Value',0)
    set(handles.stala_th2,'Value',0)
end
guidata(hObject,handles);


function stala_th1_Callback(hObject, eventdata, handles)
if get(handles.stala_th1,'Value')
    set(handles.stala_z3,'Value',0)
    set(handles.stala_th2,'Value',0)
end
guidata(hObject,handles);

function stala_th2_Callback(hObject, eventdata, handles)
if get(handles.stala_th2,'Value')
    set(handles.stala_th1,'Value',0)
    set(handles.stala_z3,'Value',0)
end
guidata(hObject,handles);

function krok_Callback(hObject, eventdata, handles)
handles.krok=str2double(get(hObject,'String'));
guidata(hObject, handles);

function krok_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dx0_Callback(hObject, eventdata, handles)
handles.dx0=str2double(get(hObject,'String'));
guidata(hObject, handles);


function dx0_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dy0_Callback(hObject, eventdata, handles)
handles.dy0=str2double(get(hObject,'String'));
guidata(hObject, handles);

function dy0_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dz0_Callback(hObject, eventdata, handles)
handles.dz0=str2double(get(hObject,'String'));
guidata(hObject, handles);

function dz0_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function delz0_Callback(hObject, eventdata, handles)
handles.delz0=str2double(get(hObject,'String'));
guidata(hObject, handles);

function delz0_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dely0_Callback(hObject, eventdata, handles)
handles.dely0=str2double(get(hObject,'String'));
guidata(hObject, handles);

function dely0_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function delx0_Callback(hObject, eventdata, handles)
handles.delx0=str2double(get(hObject,'String'));
guidata(hObject, handles);

function delx0_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dx1_Callback(hObject, eventdata, handles)
handles.dx1=str2double(get(hObject,'String'));
guidata(hObject, handles);

function dx1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dy1_Callback(hObject, eventdata, handles)
handles.dy1=str2double(get(hObject,'String'));
guidata(hObject, handles);

function dy1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dz1_Callback(hObject, eventdata, handles)
handles.dz1=str2double(get(hObject,'String'));
guidata(hObject, handles);

function dz1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function delz1_Callback(hObject, eventdata, handles)
handles.delz1=str2double(get(hObject,'String'));
guidata(hObject, handles);

function delz1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dely1_Callback(hObject, eventdata, handles)
handles.dely1=str2double(get(hObject,'String'));
guidata(hObject, handles);

function dely1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function delx1_Callback(hObject, eventdata, handles)
handles.delx1=str2double(get(hObject,'String'));
guidata(hObject, handles);

function delx1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dx2_Callback(hObject, eventdata, handles)
handles.dx2=str2double(get(hObject,'String'));
guidata(hObject, handles);

function dx2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dy2_Callback(hObject, eventdata, handles)
handles.dy2=str2double(get(hObject,'String'));
guidata(hObject, handles);

function dy2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dz2_Callback(hObject, eventdata, handles)
handles.dz2=str2double(get(hObject,'String'));
guidata(hObject, handles);

function dz2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function delz2_Callback(hObject, eventdata, handles)
handles.delz2=str2double(get(hObject,'String'));
guidata(hObject, handles);

function delz2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dely2_Callback(hObject, eventdata, handles)
handles.dely2=str2double(get(hObject,'String'));
guidata(hObject, handles);

function dely2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function delx2_Callback(hObject, eventdata, handles)
handles.delx2=str2double(get(hObject,'String'));
guidata(hObject, handles);

function delx2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dx3_Callback(hObject, eventdata, handles)
handles.dx3=str2double(get(hObject,'String'));
guidata(hObject, handles);

function dx3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dy3_Callback(hObject, eventdata, handles)
handles.dy3=str2double(get(hObject,'String'));
guidata(hObject, handles);

function dy3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dz3_Callback(hObject, eventdata, handles)
handles.dz3=str2double(get(hObject,'String'));
guidata(hObject, handles);

function dz3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function delz3_Callback(hObject, eventdata, handles)
handles.delz3=str2double(get(hObject,'String'));
guidata(hObject, handles);

function delz3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dely3_Callback(hObject, eventdata, handles)
handles.dely3=str2double(get(hObject,'String'));
guidata(hObject, handles);

function dely3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function delx3_Callback(hObject, eventdata, handles)
handles.delx3=str2double(get(hObject,'String'));
guidata(hObject, handles);

function delx3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end