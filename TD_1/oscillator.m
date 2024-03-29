
function xdot = sdof(t,x)
    k=2;c=1;m=3;
    A=[0 1;-k/m -c/m];
    xdot=A*x;

t0=0;tf=20;
x0=[0 ; 0.25];
[t,x]=ode45('sdof',[t0 tf],x0);
plot(t,x) 
 