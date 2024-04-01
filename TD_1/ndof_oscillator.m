y0=[0 0 0 0];
ti=0;
tf=10;
[time,sol]= ode45(@(t, x) ndof_system(t,x), [ti tf],y0);

set(0, 'DefaultAxesFontSize', 16);
set(0, 'DefaultTextInterpreter', 'latex');

subplot(2,1,1),plot(time,sol(:,1),time,sol(:,3))
xlabel('Time [s]'),ylabel('$y_1$ [m]'),title('dof 1 and derivative')
subplot(2,1,2),plot(time,sol(:,2),time,sol(:,4)),
xlabel('Time [s]'),ylabel('$y_2$ [m]'),title('dof 2 and derivative')


set(gcf, 'PaperSize', [6.25 7.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6.25 7.5]);

set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperSize', [6.25 7.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6.25 7.5]);

set(gcf, 'renderer', 'painters');
print(gcf, '-dpdf', 'ndof_oscillator.pdf');