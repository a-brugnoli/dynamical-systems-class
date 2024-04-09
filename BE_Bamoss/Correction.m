%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FICHIER d'INITIALISATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
close all
format short e

% Lames:
l=0.286;     % m
h=0.04;      % m
e=0.00064;    % m
E=200e9;      % N/m^2
%
J=0.015;    % Kg.m^2
L=0.335;     % m
m=0.30;      % Kg

%Calcul raideur equivalente:
I=h*e^3/12;
k=3*E*I/l^3;
we=sqrt(k/m)  % pulsation encastree de la lame:

% Inertie totale:
Jt=J+2*m*L^2;

% Matrice de masse:
M=[Jt m*L -m*L;m*L m 0; -m*L 0 m]
% Matrice de raideur: 
K=[0 0 0;0 k 0;0 0 k]
% Matrice d'amortissement: 
D=[0 0 0;0 0.001 0;0 0 0.001]
% Matrice d'entrée
F=[1;0;0]

sys=ss([zeros(3) eye(3);-inv(M)*K -inv(M)*D],[zeros(3,1);inv(M)*F],...
    [1 0 0 0 0 0;0 0 0 1 0 0;0 0 0 1 3/2/l 0],0);
damp(sys)
zpk(sys)
zpk(minreal(sys))

% Response to initial conditions:
x0=[0.18*pi/180;0.004;0.0005;20*pi/180;-0.07;0.18];
figure
initial(sys,x0,10)

% Loi de commande:
w=2;
xi=sqrt(2)/2;
Kp=Jt*w^2;
Kd=2*xi*w*Jt;
FTBO=[Kp Kd 0]*sys;
sisotool(FTBO)

% Simulation:
simu1
sim('simu1');

% Discret;
Ts=0.05;
sysd=c2d(sys,Ts);
FTBOd=[Kp Kd 0]*sysd;
sisotool(FTBOd)

% Gyroless solution:
FTBOd=[Kp+Kd*tf([1 -1],[Ts 0],Ts) 0 0]*sysd;
sisotool(FTBOd)

% Retour en beta_dot;
FTBO=[Kp 0 Kd]*sys;
sisotool(FTBO)
% ==> On voit bien l'instablité du mode flexible
% Avec un fitre F(s) passe pas du second ordre  à 8rd/s
F=tf(64,[1 10 64]);
sisotool(FTBO,F)
% On restaure la stabilité.
simu2
sim('simu2')



