%Display the color image and its Resized images by different methods

%Display the color image
I=imread('image.png');
figure,
subplot(2,2,1);
subimage(I);
title('Original Image');

%Display Resized image by Bilinear method
B=imresize(I,5);
subplot(2,2,2);
subimage(B);
title('Bilinear Image');

%Display Resized image by Nearest method
C=imresize(I,5,'nearest');
subplot(2,2,3);
subimage(C);
title('Nearest Image');

%Display Resized image by Bicubic method
D=imresize(I,5,'Bicubic');
subplot(2,2,4);
subimage(D);
title('Bicubic Image');
