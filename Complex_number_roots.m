clear
clc

Complex_A = -8;

root_A = Complex_A^(1/3)

p = [1, 0, 0, -Complex_A];

R = roots(p)

MR = abs(R(1));
t = 0:pi/20:2*pi;
x = MR * sin(t);
y = MR * cos(t);
plot(x, y, 'b:')
grid on

hold on
plot(R(2), '.', 'MarkerSize', 30, 'Color', 'r')
plot(R([1, 3]), 'o', 'MarkerSize', 15, 'Color', 'b')
axis([-3, 3, -3, 3])
axis square
hold off