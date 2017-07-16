function [p, pmax, pmin, pn] = improd(f, g)
% Function name : IMPROD
%
% Description   : [P, PMAX, PMIN, PN] = IMPROD(F, G) computes the product of 2 images
%               : It outputs the element-by-element product of two images, F and G.
%
% Arguments     : f - 1st image
%               : g - 2nd image
%
% Returns       : p - the product
%               : pmax - the maximum value
%               : pmin - the minimum value
%               : pn - the normalized product array with values in the range [0, 1]
%
% Remarks       : The input images must be of the same size. They can be of class uint8, uint16, or double.
%               : The outputs are of class double.
    fd = double(f);
    gd = double(g);
    
    % [f_row, f_col] = size(f);
    % [g_row, g_col] = size(g);
    
    if size(f) ~= size(g)
        return;
    end
    
    p = fd.*gd;
    pmax = max(p(:));
    pmin = min(p(:));
    pn = mat2gray(p);
end