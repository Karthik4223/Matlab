% Load the image
image = imread('image.png');

% Convert the image to grayscale
gray_image = rgb2gray(image);

% Convert grayscale image to double for calculations
gray_double = double(gray_image);

% Input minimum and maximum percentiles
min_percentile = 5;
max_percentile = 95;

% Calculate intensity values corresponding to the given percentiles
sorted_values = sort(gray_double(:));
num_pixels = numel(sorted_values);
min_index = ceil(num_pixels * min_percentile / 100);
max_index = ceil(num_pixels * max_percentile / 100);
Imin = sorted_values(min_index);
Imax = sorted_values(max_index);

% Define new minimum and maximum intensity values for contrast stretching
new_Imin = 0;     % Desired minimum intensity value
new_Imax = 255;   % Desired maximum intensity value

% Apply contrast stretching transformation
stretched_double = (gray_double - Imin) / (Imax - Imin) * (new_Imax - new_Imin) + new_Imin;

% Convert back to uint8 for display
stretched_image = uint8(stretched_double);

% Calculate input and output histograms
input_histogram = zeros(256, 1);
output_histogram = zeros(256, 1);

[num_rows, num_cols] = size(gray_image);

for i = 1:num_rows
    for j = 1:num_cols
        input_histogram(gray_image(i, j) + 1) = input_histogram(gray_image(i, j) + 1) + 1;
        output_histogram(stretched_image(i, j) + 1) = output_histogram(stretched_image(i, j) + 1) + 1;
    end
end

% Display the input and output histograms
figure;
subplot(2, 2, 1);
imshow(gray_image);
title('Input Grayscale Image');
subplot(2, 2, 2);
bar(input_histogram, 'FaceColor', [0.5 0.5 0.5], 'EdgeColor', 'none');
title('Input Histogram');

subplot(2, 2, 3);
imshow(stretched_image);
title('Stretched Image');
subplot(2, 2, 4);
bar(output_histogram, 'FaceColor', [0.5 0.5 0.5], 'EdgeColor', 'none');
title('Output Histogram');
