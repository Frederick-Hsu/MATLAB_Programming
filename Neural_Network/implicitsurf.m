function handle = implicitsurf(implicit_fn, xspan, yspan, zspan, grid_density)
% Function name    : implicitsurf
% Description      : Plot the surface graph of implicit function shaped as f(x, y, z) = 0
% Arguments        : implicit_func - the implicit function f(x, y, z) = c, specified by user.
%                  : xspan - specify the limit range [xlower_limit, xupper_limit] for x axis
%                  : yspan - specify the limit range [ylower_limit, yupper_limit] for y axis
%                  : zspan - specify the limit range [zlower_limit, zupper_limit] for z axis
%                  : grid_density - the density of mesh grid you want to set
%
% Example 1        :
%
% implicitsurf(inline('x.*y + z.^2'), [-5, 5])    % You must set the dot (z.^2) computation.
% 
% Example 2        :
%
% f = @(x, y, z) x.^2 + y.^2 + 0*z -1;    % NOTICE : if one argument does not exist, you must add the item 0*z
% implicitsurf(f, [-1, 1], 10)
%
% Example 3        :
% 
% f = @(x, y, z) (x.^2 + (9/4)*y.^2 + z.^2 - 1).^3 - (x.^2).*(z.^3) - (9/80)*(y.^2).*(z.^3);
% g = @(x, y, z) (sqrt(x.^2 + y.^2) - 2).^2 + z.^2 - 0.09;
% handle = implicitsurf(f, [-1.5, 1.5], [-0.8, 0.8], [-1.5, 1.5], 100);
% set(handle, 'AmbientStrength', 0.5);
% hold on;
% handle = implicitsurf(g, [-2.3, 2.3], [-2.3, 2.3], [-0.3, 0.3], 100);
% colormap hsv;
% set(handle, 'AmbientStrength', 0.8, 'FaceAlpha', 0.5);
% axis on;  axis equal;
% shading interp;
% camlight;
% lighting gouraud;
% 
    if nargin == 2
        yspan = xspan;
        zspan = xspan;
        grid_density = 25;
    elseif nargin == 3        
        grid_density = yspan;
        yspan = xspan;
        zspan = xspan;
    elseif nargin == 4
        grid_density = 25;
    elseif nargin == 5
    else
        error('Error : The arguments count exceeds the max numbers.');
    end
    
    x = linspace(xspan(1), xspan(2), grid_density);
    y = linspace(yspan(1), yspan(2), grid_density);
    z = linspace(zspan(1), zspan(2), grid_density);
    [x, y, z] = meshgrid(x, y, z);
    val = implicit_fn(x, y, z);
    
    [implicit_fn, v] = isosurface(x, y, z, val, 0);
    if isempty(implicit_fn)
        warning('There is no graph in the range.');
        handle = [];
    else
        newplot;
        p = patch('Faces', implicit_fn, ...
                  'Vertices', v, ...
                  'CData', v(:, 3), ...
                  'facecolor', 'flat', ...
                  'EdgeColor', 'k');
        isonormals(x, y, z, val, p);
        view(3);
        grid on;
    end
    
    if nargout == 0
    else
        handle = p;
    end
end