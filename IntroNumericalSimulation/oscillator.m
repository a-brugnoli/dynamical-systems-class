
% Define simulation parameters
t_0 = 0;    % Start time (s)
t_f = 20;     % End time (s)

% Define initial conditions
x0 = 0;         % Initial displacement (m)
v0 = 0;         % Initial velocity (m/s)

%[t , x]= ode45 (@(t, x) mass_spring(t, x),[t_0 t_f] , [x0, v0]) ;
[t , x]= ode45 (@(t, x) mass_spring_forced(t, x),[t_0 t_f] , [x0, v0]) ;

set(0, 'DefaultAxesFontSize', 16);
set(0, 'DefaultTextInterpreter', 'latex');

% Plot results
figure;
plot(t, x(:, 1), 'r--', 'LineWidth', 1.5);
hold on;
plot(t, x(:, 2), 'b-', 'LineWidth', 1.5);
legend({'Displacement', 'Velocity'}, 'Interpreter', 'latex');
xlabel('Time (s)');
title('Mass-Spring-Damper System');


set(gcf, 'PaperSize', [6.25 7.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6.25 7.5]);

set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperSize', [6.25 7.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6.25 7.5]);

set(gcf, 'renderer', 'painters');
print(gcf, '-dpdf', 'oscillator_forced.pdf');