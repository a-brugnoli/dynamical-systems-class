function y=explicit_euler(y0,dt,T,f)
y=y0;
yy=y0;
N=floor(T/dt);t=0;
for i=1:N
yy=yy+dt*f(t,yy);
y=[y,yy];t=t+dt;
end