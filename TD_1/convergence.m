f = @(t, x) -x;
Df = @(t, x) -1;
x0 = 1;
T = 1;
dt_vec = [1/2, 1/4, 1/8, 1/16, 1/32, 1/64];
n_dt = length(dt_vec);
x_vec = cell(n_dt, 1);

y_exact = @(t) exp(-t)*x0;
y_ex_T = y_exact(T);
error = zeros(n_dt, 1);

for i=1:n_dt
    dt=dt_vec(i);
    xx=cranck_nicholson(x0,dt,T, f, Df);
    x_vec{i} = xx;

    error(i) = norm(y_ex_T - xx(end));

end

set(0, 'DefaultAxesFontSize', 16);
set(0, 'DefaultTextInterpreter', 'latex');


% Create a semilog plot
loglog(dt_vec, error, 'b');  % 'b' specifies blue color
hold on;
loglog(dt_vec, dt_vec.^2, 'r--')
legend({'Error Cranck Nicholson', '$\Delta t^2$'}, 'Interpreter', 'latex');
% Add labels and title
xlabel('$\Delta t$ (log scale)');
ylabel('Error (log scale)');
title('Error vs $\Delta t$');

% Add grid
grid on;


set(gcf, 'PaperSize', [6.25 7.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6.25 7.5]);

set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperSize', [6.25 7.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6.25 7.5]);

set(gcf, 'renderer', 'painters');
print(gcf, '-dpdf', 'error_cranck_nicholson.pdf');

  
