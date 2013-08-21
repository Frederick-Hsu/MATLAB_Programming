t = 0:pi/50:4*pi;           % 自变量t的取值范围
y = exp(-t/3).*sin(3*t);    % 计算与自变量相应的y数组。 注意：乘法符号前面的小黑点

plot(t, y, '-r', 'LineWidth', 2)    % 绘制衰减振荡曲线
axis([0, 4*pi, -1, 1])
xlabel('t')
ylabel('y')