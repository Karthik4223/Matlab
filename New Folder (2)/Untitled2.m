% Define the dimensions
num_rows = 150;
num_cols = 2560;

% Generate the matrix with equal probabilities
A = floor(rand(num_rows, num_cols) * 256); % Values from 0 to 255

% Calculate the histogram
histogram = zeros(256, 1);
for i = 1:num_rows
    for j = 1:num_cols
        pixel_value = A(i, j);
        histogram(pixel_value + 1) = histogram(pixel_value + 1) + 1;
    end
end

% Plot the histogram
bar(0:255, histogram, 'FaceColor', [0.5 0.5 0.5], 'EdgeColor', 'none');
xlabel('Intensity Level');
ylabel('Frequency');
title('Histogram');
