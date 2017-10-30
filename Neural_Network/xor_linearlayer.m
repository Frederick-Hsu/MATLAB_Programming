% File name : xor_linearlayer.m
% Description : Use the linear neural network to classify the XOR logic.
% Creator : Frederick Hsu
% Creation date : Mon.  30 Oct, 2017
% Copyright(C) 2017 All rights reserved.
%


close all;
clear;
clc;

%% Variables
raw_sample_vector = [0, 0, 1, 1;      % x-coordinate
                     0, 1, 0, 1];     % y-coordinate
nonlinear_x_square = raw_sample_vector(1, :).^2;    % x^2
nonlinear_xy       = raw_sample_vector(1, :).*raw_sample_vector(2, :);   % xy
nonlinear_y_square = raw_sample_vector(2, :).^2;

sample_vector = [raw_sample_vector(1, :);
                 nonlinear_x_square;
                 nonlinear_xy;
                 nonlinear_y_square;
                 raw_sample_vector(2, :)];

label_vector = [0, 1, 1, 0];

%% Visualize the sample points
% Category (label = 0)
scatter([raw_sample_vector(1, 1), raw_sample_vector(1, 4)], ...
        [raw_sample_vector(2, 1), raw_sample_vector(2, 4)], ...
        'ro');
hold on;
% Category (label = 1)
scatter([raw_sample_vector(1, 2), raw_sample_vector(1, 3)], ...
        [raw_sample_vector(2, 2), raw_sample_vector(2, 3)], ...
        'b*');

axis([-0.5, 1.5, -0.5, 1.5]);
xlabel('x');
ylabel('y');
legend('Label 0', 'Label 1');

%% Build the linear neural network
mlr = maxlinlr(sample_vector, 'bias');   % Calculate the max. learning rate
% linear network
linet = linearlayer(0, mlr);
% train the linear network
linet = train(linet, sample_vector, label_vector);

%% Display the result
disp('Linear network outputs : ');
yield = sim(linet, sample_vector)

disp('Network binary outputs : ');
binary_yield = (yield >= 0.5)

disp('Final weights : ');
weights = [linet.IW{1, 1}, linet.b{1, 1}]