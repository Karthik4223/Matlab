% Load the image
image = imread('image.png');
gray_image = rgb2gray(image);

% Calculate the histogram of the input image
histogram = zeros(256, 1);
[num_rows, num_cols] = size(gray_image);

for i = 1:num_rows
    for j = 1:num_cols
        intensity = gray_image(i, j);
        histogram(intensity + 1) = histogram(intensity + 1) + 1;
    end
end

% Calculate the cumulative histogram
cumulative_histogram = zeros(256, 1);
cumulative_sum = 0;

for i = 1:256
    cumulative_sum = cumulative_sum + histogram(i);
    cumulative_histogram(i) = cumulative_sum;
end

% Calculate the cumulative distribution function (CDF)
cdf_normalized = cumulative_histogram / (num_rows * num_cols);

% Calculate the mapping function
mapping_function = round(255 * cdf_normalized);

% Apply the mapping function to the input image
equalized_image = mapping_function(gray_image + 1);

% Display results
figure;

% Histogram of the input image
subplot(2, 2, 1);
bar(histogram, 'FaceColor', [0.5 0.5 0.5], 'EdgeColor', 'none');
title('Histogram of Input Image');

% Cumulative histogram
subplot(2, 2, 2);
plot(cumulative_histogram);
title('Cumulative Histogram');

% Equalized image
subplot(2, 2, 3);
imshow(equalized_image);
title('Equalized Image');

% Mapping function
subplot(2, 2, 4);
plot(0:255, mapping_function, 'LineWidth', 2);
hold on;
plot(0:255, 0:255, 'r--', 'LineWidth', 1.5);
hold off;
title('Mapping Function');
legend('Equalization Mapping', 'Original Mapping');

% Display results
sgtitle('Global Histogram Equalization Results');
