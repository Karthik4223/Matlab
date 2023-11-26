% Example usage
inputImage = [0 0 0 0 0 0 0; 
              0 1 1 1 1 1 0; 
              0 1 1 1 1 1 0; 
              0 1 1 1 1 1 0;
              0 1 1 1 1 1 0;
              0 0 0 0 0 0 0]; % Define your binary image

%inputImage = imread('back.png');
%inputImage = rgb2gray(inputImage);
          
structuringElement = ones(2, 2); % Define a 3x3 structuring element

erodedImage = imerode(inputImage, structuringElement);
dilatedImage = imdilate(inputImage, structuringElement);
openedImage = imopen(inputImage, structuringElement);
closedImage = imclose(inputImage, structuringElement);

% Display the results
figure;
subplot(2, 2, 1), imshow(erodedImage), title('Eroded Image');
subplot(2, 2, 2), imshow(dilatedImage), title('Dilated Image');
subplot(2, 2, 3), imshow(openedImage), title('Opened Image');
subplot(2, 2, 4), imshow(closedImage), title('Closed Image');

