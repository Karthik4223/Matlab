% Program for opening and closing of the image.

input_image = imread('tom.jfif');
imshow(input_image);
title('Original Image');

se = strel('disk', 5);


opened_image = imopen(input_image, se);
figure;
imshow(opened_image);
title('Opened Image');

closed_image = imclose(input_image, se);
figure;
imshow(closed_image);
title('Closed Image');
