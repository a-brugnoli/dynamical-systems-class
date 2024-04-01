function x=newton(t,dt,xn, f, Df) 
x=xn+dt*f(t,xn);
err=1;eps=1e-9;
while err>eps
b=-Phi(t,x,dt,xn,f);
A=DPhi(t,x,dt,Df);
delta_x=A\b;
x=x+delta_x;
err=norm(delta_x);
end
end
 % Fonctions annexes %
 function y=Phi(t,x,dt,xn,f)
y=x-dt*f(t,x)-xn;
end

function y=DPhi(t,x,dt,Df)
y=eye(length(x))-dt*Df(t,x);
end