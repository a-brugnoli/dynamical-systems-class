function y=cranck_nicholson(y0,h,T,F,DF)
y=y0;
yy=y0; 
N=floor(T/h);
t=0;
for i=1:N
y2=newton(t+h/2,h/2,yy,F,DF);
yy=y2+h/2*F(t+h/2,y2);
y=[y,yy];
t=t+h;
end