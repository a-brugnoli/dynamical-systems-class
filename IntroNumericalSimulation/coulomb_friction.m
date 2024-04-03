% Parameters
m = 1;          % Mass (kg)
k = 2;         % Spring constant (N/m)
mu = 0.02;       % Coefficient of friction
g = 9.81;       % Acceleration due to gravity (m/s^2)
v0 = 1;         % Initial velocity (m/s)
x0 = 1;         % Initial displacement (m)
tspan = [0 20]; % Time span for simulation (s)

% Define the function for the differential equation
fun = @(t, Y) [Y(2); -k/m * Y(1) - sign(Y(2)) * mu * m * g];

% Solve the differential equation numerically
[t, Y] = ode45(fun, tspan, [x0; v0]);


set(0, 'DefaultAxesFontSize', 16);
set(0, 'DefaultTextInterpreter', 'latex');


% Plot the results
plot(t, Y(:,1));
xlabel('Time [s]');
ylabel('Displacement [m]');
title('Spring-Mass System with Coulomb Friction');


set(gcf, 'PaperSize', [6.25 7.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6.25 7.5]);

set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperSize', [6.25 7.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6.25 7.5]);

set(gcf, 'renderer', 'painters');
print(gcf, '-dpdf', './images/coulomb_friction_simulation.pdf');