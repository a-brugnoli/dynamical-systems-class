function xdot = mass_spring(t, x)
k =1; c =0.5; m =1;      
A =[0 1;
-k / m -c / m ];
xdot = A * x;
end