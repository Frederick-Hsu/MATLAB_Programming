function g = imtrans(f, varargin)
% Function name : IMTRANS
%
% Description   : IMTRANS performs intensity (gray-level) transformation.
%
%               : G = IMTRANS(F, 'neg') computes the negative of input image F.
%
%               : G = IMTRANS(F, 'log', C, CLASS) computes C*log(1+F) and multiplies the result by (positive) constant C.
%               : If the last 2 parameters are omitted, C defaults to 1. 
%               : Because the log is used frequently to display Fourier spectra, parameter CLASS offers the option to specify 
%               : the class of the output as 'uint8' or 'uint16'. 
%               : If parameter CLASS is omitted, the output is of the same class as the input.
%
%               : G = IMTRANS(F, 'gamma', GAM) performs a gamma transformation on the input image using parameter GAM (a required input).
%
%               : G = IMTRANS(F, 'stretch', M, E) computers a contrast-strectching transformation using the expression 1/(1 + (M/F)^E)
%               : Parameter M must be in the range [0, 1]. The default value for M is mean2(im2double(F)), and the default value for E is 4.
%
%               : For the 'neg', 'gamma', and 'stretch' transformation, double input images, whoes maximum value is greater than 1, are scaled firstly using
%               : MAT2GRAY() function. Other images are converted to double firstly using IM2DOUBLE() function.
%
%               : For the 'log' transformation, double images are transformed without being scaled; other images are converted to double firstly using
%               : IM2DOUBLE() function.
%
%               : The output is of the same class as the input image, except if a different calss is specified for the 'log' option.
%
% Arguments     : f - the input image
%               : varargin - the variable length of arguments list
%
% Returns       : g - the output image.
% 
% Remarks       :

    error(nargchk(2, 4, nargin));    % Verify the correct number of inputs
    classin = class(f);    % Store the class of input image for use later
    
    % If the input image is of class double, and it is outside the range [0, 1], and the specified transformation is NOT 'log', 
    % convert the input image to the range [0, 1]
    if (strcmp(class(f), 'double')) && (max(f(:)) > 1) && (strcmp(varargin{1}, 'log'))
        img = mat2gray(f);
    else    % convert to double, regardless of class(f)
        img = im2double(f);
    end
    
    method = varargin{1};    % Determine the type of transformation specified.
    switch method            % Perform the intensity transformation specified.
        case 'neg'
            g = imcomplement(img);
        
        case 'log'
            if length(varargin) == 1
                c = 1;
            elseif length(varargin) == 2
                c = varargin{2};
            elseif length(varargin) == 3
                c = varargin{2};
                classin = varargin{3};
            else
                error('Incorrect number of input arguments for the log option.');
            end
            g = c*(log(1 + double(img)));
        
        case 'gamma'
            if length(varargin) < 2
                error('NOT enough input arguments for the gamma option.');
            end
            gam = varargin{2};
            g = imadjust(img, [ ], [ ], gam);
        
        case 'stretch'
            if length(varargin) == 1
                m = mean2(img);    % Use the defaults
                E = 4.0;
            elseif length(varargin) == 3
                m = varargin{2};
                E = varargin{3};
            else
                error('Incorrect number of input arguments for the stretch option.');
            end
            g = 1./(1 + (m./(img + eps)).^E);
            
        otherwise
            error('Unknown enhancement method.');
    end
    
    % g = changeclass(classin, g);
end
