function y=heun(y0,dt,T, f)
y=y0;
yy=y0; 
N=floor(T/h);
t=0;
for i=1:N
yy=yy+h/2*(f(t,yy) +f(t+h,yy+h*f(t,yy)));
y=[y,yy];t=t+h;
end