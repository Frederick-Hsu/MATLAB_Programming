% File name : linear_network.m
% Description : Build the linear neural network.
% Creator : Frederick Hsu
% Creation date : Tue. 03 Oct. 2017
% Copyright(C) 2017 All rights reserved.
%

x = -5:0.2:5;
y = 3 * x - 7;

randn('state', 2);    % Set the seed, in order to repeat
y = y + randn(1, length(y)) * 1.5;
plot(x, y, 'go');

Sample = x;
Expect = y;
net = newlind(Sample, Expect);    % construct a linear layer
new_sample = -7:0.5:7;
new_yield = sim(net, new_sample);    % Simulate the new sample vector

hold on;
plot(new_sample, new_yield);

net.IW    % the weight
net.b     % the bias


%%
% Utilize newlin() function to build the linear network
linear_net = newlin(minmax(Sample), 1, [0], maxlinlr(Sample));    % Use newlin() to create the linear network
tic;
linear_net = train(linear_net, Sample, Expect);    % Train the linear network, different from newlind(), the network created by newlin() need to be trained.
toc;

new_yiled = sim(linear_net, new_sample);    % Simulate for new input sample vector

hold on;
plot(new_sample, new_yield, 'r*')

legend('Raw data points', 'The fitting line by newlind()', 'The fitting line by newlin()');
title('newlind() and newlin() fit the linear lines by LMS algorithm.');

linear_net.IW
linear_net.b


