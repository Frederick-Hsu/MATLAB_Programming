function output_img = histogram_equalization(input_img)

    orig_img = imread(input_img);
    [height, width] = size(orig_img);
    output_img = zeros(height, width);
    
    [max_val, min_val] = matrix_min_max_values(orig_img);
    
    % Do statistics on the frequency of all gray levels in the image
    freq = stats_image_pixels(orig_img);
    figure, bar(0:1:255, freq)
    
    % Calculate the probability
    prob = zeros(1, max_val);
    for i = 1:1:max_val
        prob(i) = (freq(i)/(height * width));
    end
    
    % Accumulate the normalized histogram
    accum = zeros(1, max_val);
    for i = 1:1:max_val
        for j = 1:1:i
            accum(i) = accum(i) + prob(j);
        end
    end
    figure, bar(1:1:max_val, accum);
    
    % Calculate and map to the output_img
    for i = 1:1:height
        for j = 1:1:width
            output_img(i, j) = (accum(orig_img(i, j)) * (max_val - min_val)) + min_val;
        end
    end
    
    output_img = uint8(output_img);
end


function [matrix_max, matrix_min] = matrix_min_max_values(matrix)
    [rows, cols] = size(matrix);
    
    matrix_max = matrix(1, 1);
    matrix_min = matrix(1, 1);
    
    for i = 1:1:rows
        for j = 1:1:cols
            if matrix_max < matrix(i, j)
                matrix_max = matrix(i, j);
            elseif matrix_min > matrix(i, j)
                matrix_min = matrix(i, j);
            end
        end
    end
end

function freq = stats_image_pixels(img)
    [height, width] = size(img);
    freq = zeros(1, 256);
    
    for i = 1:1:height
        for j = 1:1:width
            freq(img(i, j)) = freq(img(i, j)) + 1;
        end
    end
end