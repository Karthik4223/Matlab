%to perform image sampling and quantization using matlab
I = imread('tom.jfif');
originalImage=rgb2gray(I)
figure,imhist(originalImage)
samplingFactor = 2;
sampledImage = imresize(originalImage, 1/samplingFactor, 'nearest');

numLevels = 4; 
quantizedImage = imquantize(sampledImage, linspace(0, 255, numLevels));

subplot(1, 3, 1);
figure,imshow(originalImage);
title('Original Image');

subplot(1, 3, 2);
figure,imshow(sampledImage, []);
title('Sampled Image');

subplot(1, 3, 3);
figure,imshow(quantizedImage, []);
title('Quantized Image');

colormap(gray); 