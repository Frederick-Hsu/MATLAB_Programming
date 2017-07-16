% Study the single layer perception neural network model.

range = [-100, 100];
node_num = 1;

% Create the perception network
net = newp(range, node_num);

train_samples = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4];
labels  = [ 0,  0,  0,  0,  0, 1, 1, 1, 1, 1];

% Train the model
net = train(net, train_samples, labels)

test_samples = -10 : 0.2 : 10;
predictions = sim(net, test_samples)

plot(test_samples, predictions, 'LineWidth', 3)
title('Perception neural network model to identify the sign of digits');


%%
% Perception network Transfer Functions :  hardlim,   hardlims
%
% Calculate the hardlim() or hardlims() values

figure
subplot(2, 1, 1);
n = -5:0.01:5;
plot(n, hardlim(n), '.', 'LineWidth', 2);    % hardlim() function value
title('hardlim() transfer function');

subplot(2, 1, 2);
plot(n, hardlims(n), 'r*', 'LineWidth', 2);  % hardlims() function value
title('hardlims() transfer function');