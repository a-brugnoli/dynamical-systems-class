k=10;
m1=0.02;
m2=0.0005;
b1=410e-3;
b2=4.1e-3;
t=0:0.001:1.5;
A=[0 0 1 0;...
0 0 0 1;...
-k/m1 k/m1 -b1/m1 0;...
k/m2 -k/m2 0 -b2/m2];
B=[0;0;1/m1;0];
C=[0 0 0 1];
D=[0];
sys=ss(A,B,C,D);
y=step(sys,t);
plot(t,y);grid
xlabel('Time (seconds)'),ylabel('ydot (m/s)')