% Load the image
image = imread('image.png');
gray_image = rgb2gray(image);



% Display the original image
figure;
subplot(2, 3, 1);
imshow(gray_image);
title('Original Image');

% Add impulse noise
noisy_image_impulse = imnoise(gray_image, 'salt & pepper', 0.05);
subplot(2, 3, 2);
imshow(noisy_image_impulse);
title('Impulse Noisy Image');

% Add Gaussian noise
noisy_image_gaussian = imnoise(gray_image, 'gaussian', 0, 0.01);
subplot(2, 3, 3);
imshow(noisy_image_gaussian);
title('Gaussian Noisy Image');

% Apply different smoothing filters to remove noise
filtered_image_mean = imfilter(noisy_image_impulse, ones(3) / 9);
filtered_image_median = medfilt2(noisy_image_impulse);
filtered_image_gaussian = imgaussfilt(noisy_image_gaussian, 1);

% Display the filtered images
subplot(2, 3, 4);
imshow(filtered_image_mean);
title('Mean Filtered (Impulse)');

subplot(2, 3, 5);
imshow(filtered_image_median);
title('Median Filtered (Impulse)');

subplot(2, 3, 6);
imshow(filtered_image_gaussian);
title('Gaussian Filtered (Gaussian)');

% Calculate the PSNR
psnr_mean = psnr(filtered_image_mean, gray_image);
psnr_median = psnr(filtered_image_median, gray_image);
psnr_gaussian = psnr(filtered_image_gaussian, gray_image);

fprintf('PSNR (Mean Filter): %.2f dB\n', psnr_mean);
fprintf('PSNR (Median Filter): %.2f dB\n', psnr_median);
fprintf('PSNR (Gaussian Filter): %.2f dB\n', psnr_gaussian);

% Display results, observations, and conclusions.
