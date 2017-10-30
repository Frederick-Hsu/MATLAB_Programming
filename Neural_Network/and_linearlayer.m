% File name : and_linearlayer.m
% Description : Demonstrate how to build a logic AND linear neural network.
% Creator : Frederick Hsu
% Creation date : Sat.  28 Oct, 2017
% Copyright(C) 2017  All rights reserved.
%

%% Clean up
close all;
clear;
clc;

%% Variables
sample = [0, 0, 1, 1;      % x-coordinate
          0, 1, 0, 1]      % y-coordinate
% Add the noise to the sample 
% sample = sample + rand(2, 4) * 0.1 - 0.05

expect = [0, 0, 0, 1];     % classification label

learning_rate = maxlinlr(sample, 'bias');   % calculate the max learning rate according to the sample

%% Build the linear neural network
linet = linearlayer(0, learning_rate);
linet = train(linet, sample, expect);

%% Build the perception neural network
pernet = newp([-1, 1;
               -1, 1], 1, 'hardlim');
pernet = train(pernet, sample, expect);


%% Display the training results for the 2 networks
% Linear neural network
disp('Linear network outputs : ');
linear_yield = sim(linet, sample)

disp('Linear network binary outputs : ');
linear_binary_yield = (linear_yield >= 0.5);

disp('Linear network final weights : ');
linear_weight = [linet.IW{1, 1}, linet.b{1, 1}]

% Perception neural network 
disp('Perception network outputs : ');
perception_yield = sim(pernet, sample)

disp('Perception network binary outputs : ');
perception_binary_output = (perception_yield >= 0.5);

disp('Perception network final weights : ');
perception_weight = [pernet.IW{1, 1}, pernet.b{1, 1}]


%% Visualize the effects for the 2 networks
% Raw graph :
plot(sample(1, 1:3), sample(2, 1:3), 'ro');
xlabel('x');
ylabel('y');
axis([-0.5, 2, -0.5, 2]);

hold on;
plot(sample(1, 4), sample(2, 4), 'b*');

xrange = -2 : 0.2 : 2;
% Linear network classifying plane : w1*x + w2 * y + b = 1/2
y_linear = (0.5 - linear_weight(3))/(linear_weight(2)) - (linear_weight(1)/linear_weight(2)) * xrange;
hold on;
plot(xrange, y_linear, 'c-');

% Perception network classifying plane : w1 * x + w2 * y + b = 0
y_perception = -perception_weight(3)/perception_weight(2) - (perception_weight(1)/perception_weight(2)) * xrange;
hold on;
plot(xrange, y_perception, 'g--');

title('Utilize the linear neural network to solve the logic AND problem');
legend('Label 0', 'Label 1', 'Linear network classifying plane', 'Perception network classifying plane');

%% Mark the equation of classifying planes
syms x y;
param_vector = [x;
                y;
                1];
param_vector_latex = latex(sym(param_vector));

linear_weight_transposition = [round(linear_weight(1), 2);
                               round(linear_weight(2), 2);
                               round(linear_weight(3), 2)];
linear_coefficient_latex = latex(sym(linear_weight_transposition));    
perception_coefficient_latex = latex(sym(perception_weight'));

linear_classifying_plane_equation = sprintf('$$ %s^{T}{%s} = \\frac{1}{2} $$', linear_coefficient_latex, param_vector_latex);
perception_classifying_plane_equation = sprintf('$$ %s^{T}{%s} = 0 $$', perception_coefficient_latex, param_vector_latex);

% Linear network classifying plane equation : 
text('Interpret', 'latex', 'string', linear_classifying_plane_equation, 'position', [0, 1.5], 'FontSize', 12);
% Perception network classifying plane equation :
text('Interpret', 'latex', 'string', perception_classifying_plane_equation, 'position', [1.2, 0.7], 'FontSize', 12);