function s = subim(f, m, n, rx, cy)
% Function name : SUBIM
% Description   : SUBIM extracts the sub image from an input image f.
% Arguments     : f - the original image
%               : m, n - the subimage is of size m-by-n
%               : rx, cy - the coordinates of its top, left corner.
% Returns       : s - the sub image
% Remarks       :
%
    s = zeros(m, n);
    row = rx + m - 1;
    col = cy + n - 1;
    xcount = 0;
    ycount = 0;
    
    for r = rx:row
        xcount = xcount + 1;
        for c = cy:col
            ycount = ycount + 1;
            s(xcount, ycount) = f(r, c);
        end
    end
end