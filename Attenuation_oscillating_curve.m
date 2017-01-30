t = 0:pi/50:4*pi;          
y = exp(-t/3).*sin(3*t);   

plot(t, y, '-r', 'LineWidth', 2)   
axis([0, 4*pi, -1, 1])
xlabel('t')
ylabel('y')