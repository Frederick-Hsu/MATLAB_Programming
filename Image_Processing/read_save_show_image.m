clear
clc

% Load an image
dog_img = imread('dog.jpeg');
% Get the size of an image
[row, col, page] = size(dog_img)

whos dog_img

% Show the image
figure, imshow(dog_img)

cat_img = imread('cat.jpg');
figure, imshow(cat_img)
imwrite(cat_img, 'my_cat.jpg');     % Save the image
imwrite(cat_img, 'my_cat_q50.jpg', 'quality', 50)
imwrite(cat_img, 'my_cat_q25.jpg', 'quality', 25)
imwrite(cat_img, 'my_cat_q15.jpg', 'quality', 15)
imwrite(cat_img, 'my_cat_q5.jpg',  'quality',  5)
imwrite(cat_img, 'my_cat_q0.jpg',  'quality',  0)

% cute_cat_img = imread('cute_cat.gif');    % imread() function cannot handle the .gif image
% figure, imshow(cute_cat_img)

img_struct = imfinfo('cat.jpg')     % Display the detail information about an image
% Calculate the compression ratio
compression_ratio = (img_struct.Width * img_struct.Height * img_struct.BitDepth) / (8 * img_struct.FileSize)