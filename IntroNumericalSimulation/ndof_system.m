function ydot=ndof_system(t,y)
M=[9 0;0 1];
C=[9 -1;-1 1];
K=[27 -3;-3 3];
B=[0; 0; 1; 1];
omega=5;
F=cos(omega*t);
[n , n] = size(M);
A = [zeros(n, n), eye(n); 
        -inv(M)*K, -inv(M)*C];
ydot = A*y + B*F;
end