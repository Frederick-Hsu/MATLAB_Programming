clear
clf
clc

sourceImg = imread('noisy_fingerprint.tif');
figure, imshow(sourceImg);

grayImg = mat2gray(sourceImg);
newGrayImg = grayImg;

[height, width] = size(grayImg);
LaplacianNum = 0;
LaplacianThreshold = 0.2;

for row = 2:height-1
    for col = 2:width-1
        LaplacianNum = abs(4*grayImg(row, col  ) - grayImg(row-1, col  ) - grayImg(row+1, col) - ...
                             grayImg(row, col+1) - grayImg(row  , col-1) );
        if (LaplacianNum > LaplacianThreshold)
            newGrayImg(row, col) = 255;
        else
            newGrayImg(row, col) = 0;
        end
    end
end

figure, imshow(newGrayImg);