Complex_A = -8;

root_A = Complex_A^(1/3)

% (-8)^(1/3)的全部根的?算

% 先?造一?多?式 p(r) = r^3 - a
p = [1, 0, 0, -Complex_A];  % p是多?式p(r)的系?向量

R = roots(p)    % 求多?式的根

% 在?平面坐??中?出根的分布
MR = abs(R(1));     % ?算?根的模
t = 0:pi/20:2*pi;   % ?生??量在0到2*pi?的一????
x = MR * sin(t);
y = MR * cos(t);
plot(x, y, 'b:')    % ?出一?半??R的?
grid on

hold on
plot(R(2), '.', 'MarkerSize', 30, 'Color', 'r')     % ?第一象限的根
plot(R([1, 3]), 'o', 'MarkerSize', 15, 'Color', 'b')    % ?另外??根
axis([-3, 3, -3, 3])
axis square
hold off