% Define initial conditions
x0 = 1;         % Initial displacement (m)

% Define simulation parameters
t_start = 0;    % Start time (s)
t_end = 4;     % End time (s)

% Define time vector
dt = [0.05, 0.5];      % Time step (s)

t_1 = t_start:dt(1):t_end;
t_2 = t_start:dt(2):t_end;

% Initialize state vectors
x_1 = zeros(length(t_1), 1);
x_2 = zeros(length(t_2), 1);
x_1(1) = x0;
x_2(1) = x0;

a = -3;
% Simulate system
for i = 2:length(t_1)
    % Compute derivative of state vector
    x_1(i) = (1 + a*dt(1))*x_1(i-1);    
end

for i = 2:length(t_2)
    % Compute derivative of state vector
    x_2(i) = (1 + a*dt(2))*x_2(i-1);    
end

set(0, 'DefaultAxesFontSize', 16);
set(0, 'DefaultTextInterpreter', 'latex');


% Plot results
figure;
plot(t_1, x_1, 'r-', 'LineWidth', 1.5);
hold on;
plot(t_2, x_2, 'b--', 'LineWidth', 1.5);
hold on;
plot(t_1, exp(a*t_1)*x0, 'g', 'LineWidth', 1.5);
legend({'$\Delta t = 0.05 s$', '$\Delta t = 0.5 s$', 'Analytical'}, 'Interpreter', 'latex');

xlabel('Time (s)');
ylabel('State');


set(gcf, 'PaperSize', [6.25 7.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6.25 7.5]);

set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperSize', [6.25 7.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6.25 7.5]);

set(gcf, 'renderer', 'painters');
print(gcf, '-dpdf', 'first_order.pdf');