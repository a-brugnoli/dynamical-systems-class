function xdot = mass_spring_forced(t, x)
k =1; c =0.5; m =1;
F_0 = 1; omega=0.5;
F = [0; F_0]*cos(omega*t);        
A =[0 1;
-k / m -c / m ];
xdot = A * x + F/m;
end