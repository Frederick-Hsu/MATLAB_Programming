z1 = 4 + 3i;
z2 = 1 + 2i;

z12 = z1 + z2;

% Plot the diagram
clf, hold on
plot([0, z1, z12], '-b', 'LineWidth', 3)

plot([0, z12], '-r', 'LineWidth', 3)

plot([z1, z12], 'ob', 'MarkerSize', 8)

hold off
grid on

axis equal
axis([0, 6, 0, 6])
text(3.5, 2.3, 'z1')
text(5, 4.5, 'z2')
text(2.5, 3.5, 'z12')

xlabel('real')
ylabel('image')