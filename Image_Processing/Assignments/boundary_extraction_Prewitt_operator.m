clear
clc
clf

sourceImg = imread('region_filling_reflections.tif');
figure, imshow(sourceImg);

grayImg = mat2gray(sourceImg);
newGrayImg = grayImg;

[height, width] = size(grayImg);

PrewittNum = 0;
PrewittThreshold = 0.3;
for row = 2:height-1
    for col = 2:width-1
        PrewittNum = abs(grayImg(row-1, col+1) - grayImg(row+1, col+1)  + ...
                         grayImg(row-1, col  ) - grayImg(row+1, col  )  + ...
                         grayImg(row-1, col-1) - grayImg(row+1, col-1)) + ...
                     abs(grayImg(row-1, col+1) + grayImg(row  , col+1)  + grayImg(row+1, col+1) ...
                       - grayImg(row-1, col-1) - grayImg(row  , col-1)  - grayImg(row+1, col-1));
        if PrewittNum > PrewittThreshold
            newGrayImg(row, col) = 255;
        else
            newGrayImg(row, col) = 0;
        end
    end
end

figure, imshow(newGrayImg);