clear
clf
clc

sourceImg = imread('chickenfilet_with_bones.tif');
figure, imshow(sourceImg);

grayImg = mat2gray(sourceImg);
newGrayImg = grayImg;
[height, width] = size(grayImg);
robertsNum = 0;
robertsThreshold = 0.1;
for row = 1:height-1
    for col = 1:width-1
        robertsNum = abs(grayImg(row, col) - grayImg(row+1, col+1)) + abs(grayImg(row+1, col) - grayImg(row, col+1));
        if (robertsNum > robertsThreshold)
            newGrayImg(row, col) = 255;
        else
            newGrayImg(row, col) = 0;
        end
    end
end
figure, imshow(newGrayImg);