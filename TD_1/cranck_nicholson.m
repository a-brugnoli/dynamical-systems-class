function y=cranck_nicholson(y0,dt,T,f,df)
y=y0;
yy=y0; 
N=floor(T/dt);
t=0;
for i=1:N
y2=newton(t+dt/2,dt/2,yy,f,df);
yy=y2+dt/2*f(t+dt/2,y2);
y=[y,yy];
t=t+dt;
end