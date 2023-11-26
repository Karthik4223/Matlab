%Implementation of Image Smoothening Filters(Mean and Median filtering of an Image)

%
%Median Filters
I=imread('image.png');
K = rgb2gray(I);
J= imnoise(K ,'salt & pepper',0.05);
f= medfilt2(J,[3,3]);
f1=medfilt2(J,[10,10]);

subplot(3,2,1); imshow(I); title('Original Image');
subplot(3,2,2); imshow(K); title('Gray Image');
subplot(3,2,3); imshow(J); title('Noise added Image');
subplot(3,2,4); imshow(f); title('3x3 Image');
subplot(3,2,5); imshow(f1); title('10x10 Image');
%}

%{
%Mean Filter and Average Filter
figure;
i=imread('image.png');
g=rgb2gray(i);
g1=fspecial('average',[3 3]);
b1 = imfilter(g,g1);

subplot(2,2,1); imshow(i); title('Original Image');
subplot(2,2,2); imshow(g); title('Gray Image');
subplot(2,2,3); imshow(b1); title('3x3 Image');

g2= fspecial('average',[10 10]);
b2=imfilter(g,g2);
subplot(2,2,4); imshow(b2); title('10x10 Image');

%}

%
%{
%Implementation of filter using Convolution
figure;
I= imread('image.png');
I=I(:,:,1); subplot(2,2,1); imshow(I); title('Original Image');

a=[0.001 0.001 0.001; 0.001 0.001 0.001; 0.001 0.001 0.001];
R=conv2(a,I);

subplot(2,2,2); imshow(R); title('Filtered Image');
b=[0.005 0.005 0.005; 0.005 0.005 0.005; 0.005 0.005 0.005];

R1=conv2(b,I);
subplot(2,2,3); imshow(R1); title('Filtered Image 2');
%}


