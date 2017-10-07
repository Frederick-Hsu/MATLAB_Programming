% File name : linear_layer_fitting.m
% Description : Construct a linear layer to solve the line fitting issue.
% Creator : Frederick Hsu
% Creation date : Thu.  05 Oct. 2017
% Copyright(C) 2017 All rights reserved.
%

x = -10:10;
y = 3 * x - 7;

rand('state', 2);
y = y + randn(1, length(y)) * 1.5;

plot(x, y, 'ro');

Sample = x;
Expect = y;
learning_rate = maxlinlr(Sample, 'bias')    % Calculate the max learning rate

linear_net = linearlayer(0, learning_rate);    % Construct the linear layer using linearlayer() function, the input delay is 0.
tic;
linear_net = train(linear_net, Sample, Expect);    % Train this linear layer network
toc;

newSample = -10:0.5:10;
newYield = sim(linear_net, newSample);

hold on;
plot(newSample, newYield, 'g*');

title('linearlayer() fits the line, using LMS algorithm.');
xlabel('x');
ylabel('y');
legend('Raw data points', 'Fitting line');

s = sprintf('y = %f * x + %f', linear_net.iw{1, 1}, linear_net.b{1, 1});
text(4, 0, s);

