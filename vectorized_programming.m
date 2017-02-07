% Program name  : vectorized_programming.m
% Description   : Study how to utilize the vectorized programming to execute faster computation.
% Creator       : Frederick Hsu
% Creation date : Mon.  30 Jan. 2017
% Copyright(C)  2017    All rights reserved.

clear
clc

x = -5:0.1:5;               % x-axis
y = (-2.5:0.1:2.5)';        % y-axis

[X, Y] = meshgrid(x, y);    % Assign the coordinate(x, y) of all grid in the X-Y plane
Z = sin(abs(X.*Y));         % Compute the Z coordinate value 

% Plot this 3D surface diagram
surf(X, Y, Z);
xlabel('x');
ylabel('y');
zlabel('z');
shading interp;

view([190, 70]);
%%
% $x^2+e^{\pi i}$ 