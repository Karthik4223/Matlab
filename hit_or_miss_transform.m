% Define the binary image (0 for background, 1 for foreground)
image = [0 0 0 0 0 0 0 0;
         0 0 0 0 0 0 0 0;
         0 0 1 1 1 0 0 0;
         0 1 1 1 1 1 0 0;
         0 0 1 1 1 0 0 0;
         0 0 0 0 0 0 0 0;
         0 0 0 0 0 0 0 0;
         0 0 0 0 0 0 0 0];

% Define the foreground and background structuring elements
foreground_se = [0 1 1 1 0; 
                 1 1 1 1 1; 
                 0 1 1 1 0];

background_se = [1 0 0 0 1; 
                 0 0 0 0 0; 
                 1 0 0 0 1];

% Perform hit-or-miss transformation
eroded_foreground = imerode(image, foreground_se);
eroded_background = imerode(~image, background_se);
result = eroded_foreground & eroded_background;

% Display the result
figure;
subplot(1, 2, 1);
imshow(image);
title('Original Image');

subplot(1, 2, 2);
imshow(result);
title('Hit-or-Miss Transformation Result');
