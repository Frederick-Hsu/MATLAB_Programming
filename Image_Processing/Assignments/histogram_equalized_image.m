function output_img = histogram_equalized_image(input_img)

    orig_img = imread(input_img);
    [rows, cols] = size(orig_img);
    output_img = zeros(rows, cols);
    
    %====================================================================
    orig_img_array = zeros(1, rows * cols);
        
    index = 1;
    for row = 1:1:rows
        for col = 1:1:cols
            orig_img_array(index) = orig_img(row, col);
            index = index + 1;
        end
    end
    
    % Statistics the histgram from the image pixel values
    [gray_level_basket, freq_basket] = histgram_stats(orig_img_array);
    % Plot the bargram
    figure, bar(gray_level_basket, freq_basket, 0.2);
    % Calculate the cummulative sum
    freq_cumm_sum = cummulative_sum(freq_basket);
    % Plot the cummulative hisogram
    figure, plot(gray_level_basket, freq_cumm_sum);

    min_gray = min(freq_cumm_sum);
    for i = 1:1:rows
        for j = 1:1:cols
            index = get_index_of_gray_level_basket(gray_level_basket, orig_img(i, j));
            cdf = freq_cumm_sum(index);
            output_img(i, j) = round((cdf - min_gray) * 255 / (rows * cols - min_gray));
        end
    end
    
    output_img = uint8(output_img);
    
end

function [keys, freq] = histgram_stats(vector)
    
    vector_min = min(vector);
    vector_max = max(vector);
    len = length(vector);
    
    elements = vector_min:1:vector_max;
    qty = zeros(1, length(elements));
    
    for i = 1:1:(vector_max-vector_min+1)
        for index = 1:1:len
            if (elements(i) == vector(index))
                qty(i) = qty(i) + 1;
            end
        end
    end
    
    
    if (min(qty) > 0)     % This condition means that the element corresponding to qty = 0 doesn't exist.
        keys = elements;  % So, no need to remove any one element.
        freq = qty;
    else                  % Otherwise, you should remove the elements whoes qty = 0
        keys = elements(1);
        freq = qty(1);
        for idx = 2:1:length(qty)
            if (qty(idx) ~= 0)
                keys = [keys, elements(idx)];
                freq = [freq, qty(idx)];
            end
        end
    end
    
end

function cum_sum = cummulative_sum(freq)
    cum_sum = zeros(1, length(freq));
    
    cum_sum(1) = freq(1);
    for i = 2:1:length(freq)
        cum_sum(i) = cum_sum(i-1) + freq(i);
    end
end

function norm_sum = normalized_sum(cumm_sum)
    norm_sum = zeros(1, length(cumm_sum));
    
    len = length(cumm_sum);
    count = length(cumm_sum) - 1;
    base = cumm_sum(count + 1);
    
    for index = 1:1:len
        norm_sum(index) = (cumm_sum(index)/base)*count;
    end
end

function index = get_index_of_gray_level_basket(gray_level_basket, specific_gray_level)
    for i = 1:1:length(gray_level_basket)
        if gray_level_basket(i) == specific_gray_level
            break;
        end
    end
    index = i;
end