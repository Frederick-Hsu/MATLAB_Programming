clear
clf
clc

sourceImg = imread('lincoln_from_penny.tif');
figure, imshow(sourceImg);
grayImg = mat2gray(sourceImg);
newGrayImg = grayImg;
[height, width] = size(grayImg);

sobelNum = 0;
sobelThreshold = 0.1;

for row = 2:height-1
    for col = 2:width-1
        sobelNum = abs(  grayImg(row-1, col+1) + 2*grayImg(row, col+1) + grayImg(row+1, col+1) ... 
                       - grayImg(row-1, col-1) - 2*grayImg(row, col-1) - grayImg(row+1, col-1)) + ...
                   abs(  grayImg(row-1, col-1) + 2*grayImg(row-1, col) + grayImg(row-1, col+1) ...
                       - grayImg(row+1, col-1) - 2*grayImg(row+1, col) - grayImg(row+1, col+1));
        if (sobelNum > sobelThreshold)
            newGrayImg(row, col) = 255;
        else
            newGrayImg(row, col) = 0;
        end
    end
end

figure, imshow(newGrayImg);