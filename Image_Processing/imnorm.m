function norm_img = imnorm(input_img, param)
% Function name : IMNORM
% Description   : NORM_IMG = IMNORM(INPUT_IMG, PARAM) normalizes the input image, according to the 
%               : param which specified the range.
% Arguments     : input_img - the original image
%               : param - specifies the normalization range.
% Returns       : norm_img - the output image after normalization.
% Remarks       : 
    img = double(input_img);
    img = img - min(img(:));
    img = img./max(img(:));
    
    param = lower(param);
    if strcmp(param, 'norm1')
        norm_img = img;
    elseif strcmp(param, 'norm255')
        norm_img = 255 * img;
    else
        error('Unknown value of param');
    end
end