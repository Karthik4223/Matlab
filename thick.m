% Create a sample binary image
imag = [0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0;
        0 0 0 1 1 1 0 0 0;
        0 0 1 1 1 1 1 0 0;
        0 0 0 1 1 1 0 0 0;
        0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0];
     
% Convert to logical (binary) image
binary_image = logical(imag);

% Save as a PNG file
imwrite(binary_image, 'binary_image.png');

% Load a binary image (0 for background, 1 for foreground)
image = imread('binary_image.png');
binary_image = im2bw(image);

% Perform thinning operation
thin_result = bwmorph(binary_image, 'thin', Inf);

% Perform thickening operation
se = strel('square', 3); % Define a structuring element (you can use other shapes as well)
thick_result = imdilate(binary_image, se);

% Display results
figure;
subplot(1, 2, 1);
imshow(thin_result);
title('Thinning Result');

subplot(1, 2, 2);
imshow(thick_result);
title('Thickening Result');
