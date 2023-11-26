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
subplot(1,2,1),imshow(noisy_image);
title('Noisy Image');


psnr_value1 = psnr(noisy_image, original_image);

% Calculate MSE manually
mse_value1 = sum(sum((double(original_image) - double(noisy_image)).^2)) / numel(original_image);

fprintf('PSNR: %.2f dB\n', psnr_value1);
fprintf('MSE: %.2f\n', mse_value1);




% Define the kernel size for median filtering
kernel_size = 3; % Adjust as needed

% Remove noise using median filtering
denoised_image = medfilt2(noisy_image, [kernel_size, kernel_size]);

% Display the denoised image 
subplot(1,2,2),imshow(denoised_image);
title('Denoised Image');

% Calculate PSNR
psnr_value = psnr(denoised_image, original_image);

% Calculate MSE manually
mse_value = sum(sum((double(original_image) - double(denoised_image)).^2)) / numel(original_image);

% Display PSNR and MSE values
fprintf('PSNR: %.2f dB\n', psnr_value);
fprintf('MSE: %.2f\n', mse_value);
