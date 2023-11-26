% Load the image
image = imread('jerry.png');
gray_image = rgb2gray(image); % Convert to grayscale

% Calculate the histogram
histogram = zeros(256, 1);
[num_rows, num_cols] = size(gray_image);

for row = 1:num_rows
    for col = 1:num_cols
        pixel_value = gray_image(row, col);
        histogram(pixel_value + 1) = histogram(pixel_value + 1) + 1;
    end
end

% Plot the histogram with explicit colors
bar(0:255, histogram, 'FaceColor', [0.5 0.5 0.5]);
xlabel('Intensity Level');
ylabel('Frequency');
title('Histogram');

% Report intensity values at specific coordinates
intensity_at_20_20 = gray_image(20, 20);
intensity_at_100_100 = gray_image(100, 100);
intensity_at_185_200 = gray_image(185, 200);

disp(['Intensity value at (20, 20): ', num2str(intensity_at_20_20)]);
disp(['Intensity value at (100, 100): ', num2str(intensity_at_100_100)]);
disp(['Intensity value at (185, 200): ', num2str(intensity_at_185_200)]);
