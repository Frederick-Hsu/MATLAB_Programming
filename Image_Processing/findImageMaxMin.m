function [pixel_max, pixel_min, pixel_max_row, pixel_max_col, pixel_min_row, pixel_min_col] = findImageMaxMin(image_file_name)
% Function name : findImageMaxMin
% Description   : Find the maximum and minimal pixel gray values from a gray image, and determine their coordinates
% Arguments     : image_file_name - the string of file name, allows to contain the file path
% Returns       : pixel_max - the maximum pixel gray level value
%               : pixel_min - the minimal pixel gray level value
%               : pixel_max_row - the row coordinate of max. pixel point
%               : pixel_max_col - the col coordinate of max. pixel point
%               : pixel_min_row - the row coordinate of min. pixel point
%               : pixel_min_col - the col coordinate of min. pixel point
% Notice        : This function only accepts the gray-level image, colorful image cannot be supported.
% 
    img = imread(image_file_name);
    [height, width] = size(img);
    
    pixel_max = img(1, 1);
    pixel_min = img(1, 1);
    
    pixel_max_row = 1;
    pixel_max_col = 1;
    
    pixel_min_row = 1;
    pixel_min_col = 1;
    
    for row = 1:1:height
        for col = 1:1:width
            if pixel_max < img(row, col)
                pixel_max = img(row, col);
                pixel_max_row = row;
                pixel_max_col = col;
            elseif pixel_min > img(row, col)
                pixel_min = img(row, col);
                pixel_min_row = row;
                pixel_min_col = col;
            end
        end
    end
    
end