% Load the original image
original_image = imread('back.png');
original_image = rgb2gray(original_image);

% Define the noise probabilities for salt and pepper noise
salt_prob = 0.02; % Adjust as needed
pepper_prob = 0.02; % Adjust as needed

% Add salt and pepper noise using imnoise
noisy_image = imnoise(original_image, 'salt & pepper', salt_prob);
figure;
% Display the noisy image
subplot(2,2,1),imshow(noisy_image);
title('Noisy Image');

% Calculate PSNR before noise removal
psnr_before = psnr(noisy_image, original_image);

% Calculate MSE before noise removal manually
mse_before = sum(sum((double(original_image) - double(noisy_image)).^2)) / numel(original_image);

fprintf('PSNR (Before): %.2f dB\n', psnr_before);
fprintf('MSE (Before): %.2f\n', mse_before);

% Define the kernel size for the average filter
average_kernel_size = 3; % Adjust as needed

% Remove noise using average filtering
denoised_image_average = imfilter(noisy_image, ones(average_kernel_size) / (average_kernel_size^2), 'replicate');

% Display the denoised image after average filtering

subplot(2,2,2),imshow(denoised_image_average);
title('Denoised Image (Average Filter)');

% Calculate PSNR after average filtering
psnr_average = psnr(denoised_image_average, original_image);

% Calculate MSE after average filtering manually
mse_average = sum(sum((double(original_image) - double(denoised_image_average)).^2)) / numel(original_image);

fprintf('PSNR (After Average Filter): %.2f dB\n', psnr_average);
fprintf('MSE (After Average Filter): %.2f\n', mse_average);

% Define the kernel size for median filtering
median_kernel_size = 3; % Adjust as needed

% Remove noise using median filtering
denoised_image_median = medfilt2(noisy_image, [median_kernel_size, median_kernel_size]);

% Display the denoised image after median filtering

subplot(2,2,3),imshow(denoised_image_median);
title('Denoised Image (Median Filter)');

% Calculate PSNR after median filtering
psnr_median = psnr(denoised_image_median, original_image);

% Calculate MSE after median filtering manually
mse_median = sum(sum((double(original_image) - double(denoised_image_median)).^2)) / numel(original_image);

fprintf('PSNR (After Median Filter): %.2f dB\n', psnr_median);
fprintf('MSE (After Median Filter): %.2f\n', mse_median);
