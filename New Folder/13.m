%Canny edge detection Algorithm
i= imread('image.png');
g=rgb2gray(i);

subplot(2,2,1); imshow(i); title('Original Image');
subplot(2,2,2); imshow(g); title('Gray Image');

c=edge(g,'canny');
subplot(2,2,3); imshow(c); title('Canny output');