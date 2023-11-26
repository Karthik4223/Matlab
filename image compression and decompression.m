
compressionFactor = 4; % Adjust as needed

inputImage = imread('back.png');
inputImage = rgb2gray(inputImage);

figure;
% Apply quantization
quantizedImage = inputImage / compressionFactor;
quantizedImage = round(quantizedImage) * compressionFactor;
subplot(1,2,1);
imshow(quantizedImage);


% Reverse quantization
compressedImage = quantizedImage;
decompressedImage = compressedImage * compressionFactor;
subplot(1,2,2);
imshow(decompressedImage);

