function y=explicit_euler(y0,h,T,F)
y=y0;
yy=y0;
N=floor(T/h);t=0;
for i=1:N
yy=yy+h*F(t,yy);
y=[y,yy];t=t+h;
end