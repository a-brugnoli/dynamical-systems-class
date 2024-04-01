function y=implicit_euler(y0,h,T,F,DF)
y=y0;yy=y0;
 N=floor(T/h);t=0;
for i=1:N
yy=newton(t,h,yy,F,DF);
y=[y,yy];t=t+h;
end