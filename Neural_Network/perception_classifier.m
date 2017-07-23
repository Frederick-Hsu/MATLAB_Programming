% Perception network binary classifier

clear;
clc;
close all;

learning_rate = 0.2;
Weights = [0, 0, 0];   % Initial weights [b, w1, w2]

sample_points = [-9,  1, -12, -4,  0, 5;
                 15, -8,   4,  5, 11, 9];
% expectation = [1, 1, 0, 0, 0, 1];
expectation = [0, 1, 0, 0, 0, 1];

sample_points = [ones(1, 6); sample_points];
MAX_ITERATION_COUNT = 180;

%%
% Train the perception network
error = -1 * ones(1, 200);
i = 0;
while 1
    v = Weights * sample_points;
    Output = hardlim(v);
    
    % Calculate the error
    error(i+1) = mae(expectation - Output);
    if (error(i+1) < 0.001)
        disp('We have gotten it : ');
        disp(Weights);
        break;
    end
    
    % Update the weights and bias
    Weights = Weights + learning_rate * (expectation - Output) * sample_points';
    i = i + 1;
    if (i >= MAX_ITERATION_COUNT)
        disp('MAX iteration count reached.');
        disp(Weights);
        disp(error(i+1));
        break;
    end
end

%%
% Visualize the binary classification result

figure(1);
% scatter([-12, -4, 0], [4, 5, 11], 'r*');
scatter([-9, -12, -4, 0], [15, 4, 5, 11], 'r*');
hold on;
% scatter([-9, 1, 5], [15, -8, 9], 'b^');
scatter([1, 5], [-8, 9], 'b^');

axis([-14, 8, -10, 16]);
xlabel('x');
ylabel('y');
legend('class 0', 'class 1');

x = -12:1:6;
y = (-Weights(1) - Weights(2)*x)/Weights(3);
plot(x, y, 'g-.');
grid on;

figure(2)
x = 0 : i;
plot(x, error(1:i+1), 'o-');
grid on;
xlabel('iteration count');
ylabel('Mean Absolute Error');
string = sprintf('MAE value (iteration count : %d)', i+1);
title(string);


%%

net = newp([-20, 20; -20, 20], 1);    % Create the perception network
net = train(net, sample_points(2:3, :), expectation);    % Train the network
output = sim(net, sample_points(2:3, :))    % Expectation output

temp_weights = net.IW;
temp_bias = net.b;
network_weights = [temp_bias{1}, temp_weights{1}]

figure(3);
scatter([-9, -12, -4, 0], [15, 4, 5, 11], 'r*');
hold on;
scatter([1, 5], [-8, 9], 'b^');

hold on;
separator_line_x = -12:1:6;
separator_line_y = (-network_weights(1) - network_weights(2)*separator_line_x)/network_weights(3);
plot(separator_line_x, separator_line_y, 'g-.');

grid on;
title('Perception network to classify the linear separation');
legend('class 0', 'class 1', 'spearator line');