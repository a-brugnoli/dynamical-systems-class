function y=runge_kutta_4(y0,dt,T,f)
y=y0;
yy=y0; 
N=floor(T/dt);t=0;
    for i=1:N
        k1=f(t,yy);
        k2=f(t+dt/2,yy+dt/2*k1);
        k3=f(t+dt/2,yy+dt/2*k2);
        k4=f(t+dt,yy+dt*k3);
        yy=yy+dt/6*(k1+2*k2+2*k3+k4);
        y=[y,yy];t=t+dt;
    end
end