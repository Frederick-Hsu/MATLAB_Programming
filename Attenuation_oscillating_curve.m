clear
clc

t = 0:pi/50:4*pi;       % define the range of independent variable t
y = exp(-t/3).*sin(3*t);    % compute the dependant variable y, corresponding to x.  CAUTION : the dot . operator

plot(t, y, '-r', 'LineWidth', 2)    % plot the curve
axis([0, 4*pi, -1, 1])
xlabel('t')
ylabel('y')