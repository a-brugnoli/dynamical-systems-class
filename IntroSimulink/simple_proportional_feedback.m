% Define a second order dynamical system
t = 0:0.01:6;
s = tf('s');
P = 1/(s^2 + 8.8*s + 40);
subplot(211);
step(P,t)
% Introduce a proportional controller
Kp = 500;
C = pid(Kp)
T = feedback(C*P,1)
subplot(212)
step(T,t)