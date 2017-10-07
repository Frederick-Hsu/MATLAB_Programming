% File name : plot_implicit_function_graph.m
% Description : Plot the mesh or surface graph of implicit function shaped as f(x, y, z) = 0
% Creator : Frederick Hsu
% Creation date : Sat. 07 Oct. 2017
% Copyright(C) 2017 All rights reserved.
%

% Heart Shape
  f = @(x, y, z) (x.^2 + (9/4)*y.^2 + z.^2 - 1).^3 - (x.^2).*(z.^3) - (9/80)*(y.^2).*(z.^3);
% Ring Shape
  g = @(x, y, z) (sqrt(x.^2 + y.^2) - 2).^2 + z.^2 - 0.09;
  
  figure(1);
  handle = implicitsurf(f, [-1.5, 1.5], [-0.8, 0.8], [-1.5, 1.5], 100);  
  set(handle, 'AmbientStrength', 0.5);
  hold on;  
  handle = implicitsurf(g, [-2.3, 2.3], [-2.3, 2.3], [-0.3, 0.3], 100);
  
  colormap hsv;
  set(handle, 'AmbientStrength', 0.8, 'FaceAlpha', 0.5);
  axis on;  axis equal;
  shading interp;
  camlight;
  lighting gouraud;
  colorbar;
  
  xlabel('x');
  ylabel('y');
  zlabel('z');
  
  text('Interpreter', 'latex', 'string', ...
       '$$ (x^2 + \frac{9}{4}y^2 + z^2 - 1)^3 = x^2z^3 + \frac{9}{80}y^2z^3 $$', ...
       'position', [0, 0, 1.5], ...
       'FontSize', 16);
   
   text('Interpreter', 'latex', 'string', ...
        '$$ (\sqrt{x^2 + y^2} - 2)^2 + z^2 = \frac{9}{100} $$', ...
        'position', [0, -2.5, 0], ...
        'FontSize', 16);
   
   title('Plotting the surface graph of implicit functions');


%%
figure(2);
h = implicitmesh(f, [-1.5, 1.5], [-0.8, 0.8], [-1.5, 1.5], 100);
hold on;
h = implicitmesh(g, [-2.3, 2.3], 100);
colormap hsv;
set(h, 'facecolor', 'none');
axis on;
axis equal;
xlabel('x');  ylabel('y');  zlabel('z');

  text('Interpreter', 'latex', 'string', ...
       '$$ (x^2 + \frac{9}{4}y^2 + z^2 - 1)^3 - x^2z^3 = \frac{9}{80}y^2z^3 $$', ...
       'position', [0, 0, 1.5], ...
       'FontSize', 16);
   
   text('Interpreter', 'latex', 'string', ...
        '$$ (\sqrt{x^2 + y^2} - 2)^2 + z^2 = \frac{9}{100} $$', ...
        'position', [0, -2.5, 0], ...
        'FontSize', 16);
   
   title('Plotting the mesh graph of implicit functions');
