% File name : binary_logic_AND_classification.m
% Description : Implement a binary value logic --- AND, to classify 4 data points.
% Creator : Frederick Hsu
% Creation date : Thu. 05 Oct. 2017
% Copyright(C) 2017 All rights reserved.
%

clear;
clc;
close all;
%% Display the 4 data points
% Class A
A_X = [0, 0, 1];  % x coordinates of 3 points in Class A group
A_Y = [1, 0, 0];  % y coordinates of 3 points in Class A group
scatter(A_X, A_Y, 'ro');
xlabel('x');
ylabel('y');
axis([-0.5, 1.5, -0.5, 1.5]);

% Class_B
B_X = [1];    % x, y coordinates of 1 point in Class B group
B_Y = [1];
hold on;
scatter(B_X, B_Y, 'g*');
legend('Class A : 0', 'Class B : 1');
title('Binary Logic AND classification diagram');

%% Calculate the classification line parameters : bias, w1, w2
Sample_Vectors = [0, 0, 1, 1;       % x coordinate
                  1, 0, 1, 0];      % y coordinate
              
Bias_Sample_Vectors = [1, 1, 1, 1;    % bias
                       0, 0, 1, 1;    % x coordinate
                       1, 0, 1, 0];   % y coordinate

Label = [0, 0, 1, 0];    % classification tag

% Pseudo inverse method to solve the bias, w1 and w2
solution = pinv(Bias_Sample_Vectors') * Label'

%% Display the classification line
x = -1:2;
y = 1.5 - x;

hold on;
plot(x, y, 'b-');

syms x y;
param = [x; y];
paramLatex = latex(sym(param));

coff = [solution(2); solution(3)];
coffLatex = latex(sym(coff));

latexString = sprintf('$$ %s^{T}{%s} %.02f = \\frac{1}{2} $$', coffLatex, paramLatex, solution(1));
text('Interpreter', 'latex', 'string', latexString, 'Position', [0.5, 1], 'FontSize', 16);                  