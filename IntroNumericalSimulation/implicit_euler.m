function y=implicit_euler(y0,dt,T,f,df)
y=y0;yy=y0;
 N=floor(T/dt);t=0;
for i=1:N
yy=newton(t,dt,yy,f,df);
y=[y,yy];t=t+dt;
end