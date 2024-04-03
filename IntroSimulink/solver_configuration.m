% Load the Simulink model
load_system('ex_problem_default_configuration.slx');

% Simulate the model
sim_output = sim('ex_problem_default_configuration.slx', 'SimulationMode', 'normal', ...
    'SaveOutput', 'on', 'OutputSaveName', 'output');

% Extract time steps
time_values = sim_output.tout;

input_values = sim_output.output{2}.Values; % Access simulation output
figure;
plot(input_values); 

hilbert(input_values)

% Plot results
output_values = sim_output.output{1}.Values; % Access simulation output
figure;
plot(output_values); 

figure;
plot(time_values(2:end), diff(time_values)); % Plot input and output signals

% Optionally, you can close the model after simulation
%close_system('ex_problem_default_configuration.slx');
