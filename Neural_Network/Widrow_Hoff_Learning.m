% File name : Widrow_Hoff_Learning.m
% Description : Implement a linear neural network using the learnwh() function.
% Creator : Frederick Hsu
% Creation date : Wed. 04 Oct. 2017
% Copyright(C) 2017 All rights reserved.
% 

clear;
clc;
close all;

% Define the data
P = -5:5;
d = 3 * P - 7;

randn('state', 2);
d = d + randn(1, length(d)) * 1.5;    % Expectation

P = [ones(1, length(P)); P];    % Append the bias
% lp.lr = 0.01;    % Manually specify the learning rate
lp.lr = maxlinlr(P);    % Calculate the max learning rate
MAX_Iterations = 150;    % max iteration step numbers

ep1 = 0.1;    % Epsilon 1 : the terminate threshold for MSE
ep2 = 0.0001;    % Epsilon 2 : the terminate threshold for weights changing

%% Initialization
W = [0, 0];

%% Iteration
for i = 1:MAX_Iterations
    fprintf('Iteration %d : \n', i);
    e = d - purelin(W * P);    % Calculate the error vector
    ms(i) = mse(e);    % Mean Square Error
    % ms(i)
    if (ms(i) < ep1)
        fprintf('Terminate if the MSE is less than the epsilon 1.');
        break;
    end
    
    dW = learnwh([], P, [], [], [], [], e, [], [], [], lp, []);    % Adjust the weights
    if (norm(dW) < ep2)    % Algorithm converged
        fprintf('Terminate while the weight changing had been less than the epsilon.\n');
        break;
    end
    W = W + dW;    % Update the weights
end

%% Display
fprintf('Algorithm converges at : \nbias = %f, weight = %f, MSE = %f\n', W(1), W(2), ms(i));

figure;
subplot(2, 1, 1);

plot(P(2, :), d, 'o');
title('Scatter and line fitting effects');
xlabel('x');
ylabel('y');
axis([-6, 6, min(d)-1, max(d)+1])

x1 = -5:0.2:5;
y1 = W(1) + W(2) * x1;
hold on;
plot(x1, y1, 'r*');
legend('Scatter points', 'Fitting line');

subplot(2, 1, 2);
semilogy(1:i, ms, '-o');
title('MSE descending curve');
xlabel('iteration counts');
ylabel('MSE');
