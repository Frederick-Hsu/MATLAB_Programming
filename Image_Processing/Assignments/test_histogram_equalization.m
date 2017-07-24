orig_img = imread('stone.jpeg');
imshow(orig_img);

out_img = histogram_equalized_image('stone.jpeg');
imshow(out_img)