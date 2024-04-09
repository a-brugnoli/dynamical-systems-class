%% Modeling and control of a pendulum on a cart.
%
%%
clear all
close all
bdclose all
warning('off')

%% The system.
% Let us consider the system depicted in the following Figure and composed of
% a cart of mass $M\,(Kg)$ fitted with a pendulum of lenght $l\,(m)$ and a 
% tip mass $m\,(Kg)$. An actuator allows a force $u\,(N)$ (control signal) to be
% applied on the cart along $(O,\vec{x})$ axis. $g=9.81\,m/s^2$ is the gravity along $-\vec{z}$ axis.
%
% $\mathcal{R}_i=(0,\vec{x},\vec{y},\vec{z})$ is an inertial frame.
% 
% Such a system has 2 d.o.fs (degrees of freedom):
% 
% * $x$ is the linear position of the cart along the horizontal $(0,\,\vec{x})$ axis,
% * $\varphi$ is the attitude of the pendulum around the horizontal $(A,\,\vec{y})$ axis.
%
%%
% 
% <<../mypendule.png>>
%
% see also:  <https://en.wikipedia.org/wiki/Inverted_pendulum Inveted pendulum>
%% Modelling using _LAGRANGE_ derivation.
% 
% * *Kinetic energy* :
% 
% $$T=\frac{1}{2}M\dot{x}^2+\frac{1}{2}m|\vec{V}_B|^2$$
%
% with: 
%
% $$\vec{V}_B=\frac{d\vec{OB}}{dt}|_{\mathcal{R}_i}=\cdots$$
%
% $$ \cdots$$
%
%% to be continued during labwork...
% By waiting for more, you can play with the pendulum demo proposed in
% Matlab:
open_system('pendulum_demo')