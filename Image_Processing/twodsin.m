function [rt, f, g] = twodsin(Amplitude, u0, v0, M, N)
% Function name : TWODSIN 
%
% Description   : Compare for loops vs. vectorization.
%               : The comparison is based on implementing the function 
%               : f(x, y) = A*sin(u0*x + v0*y)
%               : for x = 0, 1, 2, ..., M-1 and y = 0 , 1, 2, ..., N-1
%
% Arguments     : Amplitude - the amplitude of this 2D sine function
%               : u0 - the coefficient of variable x
%               : v0 - the coefficient of variable y
%               : M - indicates the range of variable x
%               : N - indicated the range of variable y
%
% Returns       : rt - the time-ratio between for-loop and vectorization in performance perspective.
%               : f - output the image f
%               : g - output the image g
%
% Remarks       : 
    tic;     % start timing
    % =====================================================================
    % First implementation using for-loops.
    for r = 1:M
        u0x = u0 * (r-1);
        for c = 1:N
            v0y = v0 * (c-1);
            f(r, c) = Amplitude * sin(u0x + v0y);
        end
    end
    t1 = toc;   % End timing
    
    % =====================================================================
    % Now implement using vectorization. call the image g
    tic;        % Start timing
    row = 0:M-1;
    col = 0:N-1;
    [COL, ROW] = meshgrid(col, row);
    g = Amplitude * sin(u0 * ROW +  v0 * COL);
    t2 = toc;   % End timing
    
    % =====================================================================
    % Compute the ratio of the 2 times
    rt = t1/(t2+eps);   % Use epsilon in case t2 is close to 0
end