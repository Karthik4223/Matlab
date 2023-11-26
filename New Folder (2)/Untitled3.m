% Load the color image
i = imread('jerry.png');
image=imresize(i,[250,350]);
% Calculate dimensions
num_rows = size(image, 1);
num_cols = size(image, 2);

% Initialize variables for channel averages
average_intensity_r = 0;
average_intensity_g = 0;
average_intensity_b = 0;

% Calculate average intensities of R, G, and B channels
for i = 1:num_rows
    for j = 1:num_cols
        average_intensity_r = average_intensity_r + double(image(i, j, 1));
        average_intensity_g = average_intensity_g + double(image(i, j, 2));
        average_intensity_b = average_intensity_b + double(image(i, j, 3));
    end
end

average_intensity_r = average_intensity_r / (num_rows * num_cols);
average_intensity_g = average_intensity_g / (num_rows * num_cols);
average_intensity_b = average_intensity_b / (num_rows * num_cols);

% Calculate the average intensity of the image
average_intensity_image = (average_intensity_r + average_intensity_g + average_intensity_b) / 3;

% Convert the color image to grayscale
gray_image = zeros(num_rows, num_cols);

for i = 1:num_rows
    for j = 1:num_cols
        gray_image(i, j) = 0.2989 * image(i, j, 1) + 0.5870 * image(i, j, 2) + 0.1140 * image(i, j, 3);
    end
end

% Display results
disp(['Average Intensity of Red Channel: ', num2str(average_intensity_r)]);
disp(['Average Intensity of Green Channel: ', num2str(average_intensity_g)]);
disp(['Average Intensity of Blue Channel: ', num2str(average_intensity_b)]);
disp(['Average Intensity of Image: ', num2str(average_intensity_image)]);

% Show the grayscale image
imshow(uint8(gray_image));
title('Grayscale Image');
